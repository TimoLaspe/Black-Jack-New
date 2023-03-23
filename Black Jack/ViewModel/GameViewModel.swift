//
//  GameViewModel.swift
//  Black Jack
//
//  Created by Timo Laspe on 18.02.23.
//

import Foundation
import Firebase


@MainActor class GameViewModel: ObservableObject{
    
    let profileViewModel : ProfileViewModel
    
    // Player
    @Published var playersBet : Int = 0
    @Published var playerCardStack : [Card] = []
    @Published var leftCardStack : [Card] = []
    @Published var rightCardStack : [Card] = []
    @Published var playerValue : Int = 0
    @Published var splitDeckValueLeft : Int = 0
    @Published var splitDeckValueRight : Int = 0
    @Published var splitCardsCounterLeft : Int = 1
    @Published var splitCardsCounterRight : Int = 1
    
    // Dealer
    @Published var dealerCardStack : [Card] = []
    @Published var dealerValue : Int = 0
    
    // Game
    @Published var playerCanSplit : Bool = false
    @Published var handIsSplit : Bool = false
    @Published var playerCanBet : Bool = false
    @Published var playerCanDouble : Bool = false
    @Published var leftDeckIsActive : Bool = true
    @Published var playerWins : Bool = false
    @Published var dealerWins : Bool = false
    @Published var levelCounter : Int = 26
    @Published var progressValue: Float = 0.0
    @Published var musicIsOn : Bool = true
    @Published var cards : [Card] = []
    @Published var playedCards : [Card] = []
    @Published var dataLoaded: Bool = false
    @Published var gameIsSet : Bool = false
    @Published var playedCardsStack : [Card] = []
    @Published var isShuffling : Bool = false
    @Published var showDealerCards : Bool = false
    @Published var isAnimated : Bool = false
    @Published var draw : Bool = false
    @Published var blackJack : Bool = false
    
    // Login
    
    @Published var userIsLoggedIn : Bool = false
    
    
    init(profileViewModel: ProfileViewModel){
        
        self.profileViewModel = profileViewModel
        
        fetchCards(completion: { sourceData in
            self.cards = sourceData.cards
            self.dataLoaded = true
            self.setGame()
            self.playerCanBet = true
            self.checkForSplit()
        })
    }
    
    
    let baseURL = "https://www.deckofcardsapi.com/api/deck/"
    func fetchCards(completion: @escaping(SourceData) -> Void){
        
        let url = URL(string: baseURL + "new/draw/?count=52")
        guard url != nil else {return}
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!){data, response,
            error in
            
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                
                do{
                    let sourceData = try
                    decoder.decode(SourceData.self, from: data!)
                    DispatchQueue.main.async {
                        completion(sourceData)
                    }
                } catch let error {
                    print("ERROR parsing JSON")
                    print(error)
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    func setPlayersBet(value: Int){
        playersBet = playersBet + value
        print(playersBet)
        profileViewModel.cash = profileViewModel.cash - playersBet
        playerCanBet = false
    }
    
    func getCash(){
        profileViewModel.cash += playersBet * 2
    }
    
    func updatePlayerValue(){
        var sum = 0
        for card in playerCardStack{
            sum += checkCardValue(card: card)
        }
        playerValue = sum
    }
    
    func updateDealerValue(){
        var sum = 0
        for card in dealerCardStack{
            sum += checkCardValue(card: card)
        }
        dealerValue = sum
    }
    
    
    func setGame(){
        while playerCardStack.count < 2 {
            playerGetCard()
        }
        while dealerCardStack.count < 2 {
            nextDealerCard()
        }
        gameIsSet = true
    }
    
    
    func playerGetCard(){
        checkCardsCapacity()
        playerCardStack.append(cards.remove(at: 0))
        updatePlayerValue()
    }
    
    func nextDealerCard()  {
        checkCardsCapacity()
        dealerCardStack.append(cards.removeFirst())
        updateDealerValue()
    }
    
    func checkCardsCapacity(){
        if cards.isEmpty{
            isShuffling = true
            cards.append(contentsOf: playedCardsStack)
            playedCardsStack = []
            cards.shuffle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isShuffling = false
                    }
        }
    }
    
    // MARK: Ass auf 1 oder 11 prüfen
    
    func aceValue(for playerCardStack: [Int]) -> Int {
        let sum = playerCardStack.reduce(0, +)
        return sum + 10 <= 21 ? 11 : 1
    }

    func checkForSplit(){
        let firstCard = playerCardStack[0]
        let secondCard = playerCardStack[1]
        if(firstCard.value == secondCard.value){
            playerCanSplit = true
        }
    }
    
    func checkCardValue(card : Card) -> Int {
        switch card.value {
        case "KING", "QUEEN", "JACK" :
            return 10
        case "ACE" :
            return 11
        default :
            return Int(card.value) ?? 0
        }
    }
    
    func resetCards(){
        checkCardsCapacity()
        gameIsSet = false
        dealerWins = false
        playerWins = false
        draw = false
        playerValue = 0
        dealerValue = 0
        playersBet = 0
        playedCardsStack.append(contentsOf: playerCardStack)
        playedCardsStack.append(contentsOf: dealerCardStack)
        playerCardStack = []
        dealerCardStack = []
        playerCanBet = true
        setGame()
    }
    
    func checkWinner(){
        if(playerValue > dealerValue && playerValue <= 21){
            win()
            
        } else if(dealerValue > 21 && playerValue <= 21){
            win()
            
        } else if(dealerValue <= 21 && dealerValue >= 17 && dealerValue > playerValue){
            dealerWins = true
            
        } else if(playerValue > 21){
            dealerWins = true
    
        } else if(dealerValue == playerValue){
            draw = true
        }
    }
    
    // MARK: Geht das überhaupt?
    func checkForBlackJack(){
        for card in playerCardStack{
            if(card.value == "JACK" && card.value == "ACE"){
                blackJack = true
            }
        }
    }
    
    func win(){
        playerWins = true
        profileViewModel.wonHandsCounter += 1
        progressValue += 0.1
        if(progressValue == 1.0){
            levelUp()
        }
    }
    
    func levelUp(){
        profileViewModel.level += 1
        progressValue = 0.0
    }
    
    func dealersTurn(){
        checkCardsCapacity()
        while dealerValue < 17 {
            nextDealerCard()
        }
        checkWinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.resetCards()
        }
    }
    
    func doubleBet(){
        checkCardsCapacity()
        playersBet = playersBet * 2
        let newCard = cards.removeFirst()
        playerCardStack.append(newCard)
        dealersTurn()
    }
    
    func playerHits(){
        playerCanSplit = false
        playerCanDouble = false
        checkCardsCapacity()
        if(!handIsSplit){
            playerGetCard()
        } else if(handIsSplit && leftDeckIsActive) {
            leftCardStack.append(cards.removeFirst())
        } else if(handIsSplit && !leftDeckIsActive) {
            rightCardStack.append(cards.removeFirst())
        }
        isAnimated = true
    }
    
    func playerStandsWhileSplit(){
        
    }
    
    func playerStands(){
        if(handIsSplit){
            leftDeckIsActive = false
            splitCardsCounterLeft = 1
        } else {
            dealersTurn()
        }
    }
    
    func playerSplits(){
        checkCardsCapacity()
        leftCardStack.append(playerCardStack.remove(at: 0))
        rightCardStack.append(playerCardStack.remove(at: 0))
        handIsSplit = true
        playerCanSplit = false
    }
    
    
    
}
