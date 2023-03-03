//
//  GameViewModel.swift
//  Black Jack
//
//  Created by Timo Laspe on 18.02.23.
//

import Foundation

@MainActor class GameViewModel: ObservableObject{
    
    // Player
    @Published var playersBet : Int = 0
    @Published var playersCardsCounter : Int = 2
    @Published var playerCardStack : [Card] = []
    @Published var leftCardStack : [Card] = []
    @Published var rightCardStack : [Card] = []
    @Published var playerValue : Int = 0
    @Published var splitDeckValueLeft : Int = 0
    @Published var splitDeckValueRight : Int = 0
    @Published var splitCardsCounterLeft : Int = 1
    @Published var splitCardsCounterRight : Int = 1
    
    // Dealer
    @Published var dealersCardsCounter : Int = 2
    @Published var dealerCardStack : [Card] = []
    @Published var dealerValue : Int = 0
    
    // Game
    @Published var playerCanSplit : Bool = true
    @Published var handIsSplit : Bool = false
    @Published var playerCanBet : Bool = false
    @Published var playerCanDouble : Bool = false
    @Published var leftDeckIsActive : Bool = true
    @Published var playerWins : Bool = false
    @Published var dealerWins : Bool = false
    @Published var levelCounter : Int = 26
    @Published var cash : Int = 6000
    @Published var progressValue: Float = 0.8
    @Published var musicIsOn : Bool = true
    @Published var cards : [Card] = []
    @Published var playedCards : [Card] = []
    @Published var dataLoaded: Bool = false
    @Published var gameIsSet : Bool = false
    
    init(){
        fetchCards(completion: { sourceData in
            self.cards = sourceData.cards
            self.dataLoaded = true
            self.setGame()
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
    
    func setGame(){
        while playersCardsCounter < 2 {
            playerGetCard()
        }
        while dealersCardsCounter < 2 {
            nextDealerCard()
        }
        gameIsSet = true
    }
    
    func playerGetCard(){
        var newCard : Card = Card(code: cards[0].code, image: cards[0].image, value: cards[0].value, suit: cards[0].suit)
        playerCardStack.append(newCard)
        cards.remove(at: 0)
        playersCardsCounter += 1
    }
    
    func nextDealerCard() {
        var newCard : Card = Card(code: cards[0].code, image: cards[0].image, value: cards[0].value, suit: cards[0].suit)
        dealerCardStack.append(newCard)
        cards.remove(at: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.dealersCardsCounter += 1
                }
    }
    
    func resetCards(){
        dealersCardsCounter = 2
        playersCardsCounter = 2
        dealerWins = false
        playerWins = false
    }
    
    func checkWinner(){
        if(playerValue > dealerValue && playerValue <= 21){
            playerWins = true
        } else if(dealerValue <= 21 && dealerValue >= 17 && dealerValue > playerValue){
            dealerWins = true
        }
    }
    
    func dealersTurn(){
        while dealerValue < 17 {
            nextDealerCard()
        }
        checkWinner()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.resetCards()
        }
    }
    
    func doubleBet(){
        playersBet = playersBet + playersBet
        playersCardsCounter += 1
        dealersTurn()
    }
    
    func playerHits(){
        playerCanSplit = false
        playerCanDouble = false
        if(!handIsSplit){
            playerGetCard()
            playersCardsCounter += 1
        } else if(handIsSplit && leftDeckIsActive) {
            splitCardsCounterLeft += 1
        } else if(handIsSplit && !leftDeckIsActive) {
            splitCardsCounterRight += 1
        }
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
        handIsSplit = true
        playerCanSplit = false
    }
    
}
