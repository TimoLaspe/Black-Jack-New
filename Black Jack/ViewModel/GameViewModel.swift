//
//  GameViewModel.swift
//  Black Jack
//
//  Created by Timo Laspe on 18.02.23.
//

import Foundation
import Firebase
import AVFAudio

var audioPlayer : AVAudioPlayer!

@MainActor class GameViewModel: ObservableObject{
    
    // Profile
    @Published var profiles : [Profile] = []
    @Published var sortedProfiles : [Profile] = []
    @Published var cash : Int = 0
    @Published var playedGamesCounter : Int = 0
    @Published var wonHandsCounter : Int = 0
    @Published var nickName : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var level : Int = 0
    
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
    @Published var musicIsOn : Bool = false
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
    @Published var inputAvailable : Bool = true
    @Published var showDealerValue : Bool = false
    @Published var audioPlayer: AVAudioPlayer!
    
    var aceInStack : Bool = false
    
    // Login
    
    @Published var userIsLoggedIn : Bool = false
    @Published var currentUser : Profile = Profile(id: "", nickName: "", level: 0, playedGames: 0, wonHands: 0, cash: 0)
    
    
    init(){
        
        getProfileData()
        
        fetchCards(completion: { sourceData in
            self.cards = sourceData.cards
            self.dataLoaded = true
            self.setHighscores()
            self.setGame()
            self.playerCanBet = true
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
    
    func setHighscores(){
        sortedProfiles.append(contentsOf: profiles)
        sortedProfiles.sort{ $0.cash > $1.cash }
    }
    
    
    func playMusic(){
        
            let url = Bundle.main.url(forResource: "backgroundSong", withExtension: "mp3")
            
            guard url != nil else {
                return
            }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url!)
                if(musicIsOn){
                    audioPlayer?.play()
                } else {
                    audioPlayer?.stop()
                }
            } catch {
                print("\(error)")
            }
        }
    
    
    
    func setPlayersBet(value: Int){
        playersBet = playersBet + value
        print(playersBet)
        currentUser.cash -= playersBet
        playerCanBet = false
    }
    
    func getCash(){
        currentUser.cash += playersBet * 2
    }
    
    func updatePlayerValue(){
        var sum = 0
        for card in playerCardStack{
            sum += checkCardValue(card: card)
        }
        if(aceInStack){
            if(sum + 11 <= 21){
                sum += 11
            } else {
                sum += 1
            }
            aceInStack = false
        }
        playerValue = sum
    }
    
    func updateDealerValue(){
        var sum = 0
        for card in dealerCardStack{
            sum += checkCardValue(card: card)
        }
        if(aceInStack){
            if(sum + 11 <= 21){
                sum += 11
            } else {
                sum += 1
            }
            aceInStack = false
        }
        dealerValue = sum
    }
    
    
    func setGame(){
        showDealerCards = false
        while playerCardStack.count < 2 {
            playerGetCard()
        }
        while dealerCardStack.count < 2 {
            nextDealerCard()
        }
        gameIsSet = true
        checkForBlackJack()
        checkForSplit()
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
            if(aceInStack){
                return 1
            } else {
                aceInStack = true
                return 0
            }
        default :
            return Int(card.value) ?? 0
        }
    }
    
    func resetCards(){
        updateProfileData()
        getCurrentUserProfile()
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
        inputAvailable = true
    }
    
    func stopUserInput(){
        if(dealerWins == true || playerWins == true){
            inputAvailable = false
        }
    }
    
    func checkWinner(){
        if(playerValue > dealerValue && playerValue <= 21){
            stopUserInput()
            win()
            
        } else if(dealerValue > 21 && playerValue <= 21){
            stopUserInput()
            win()
            
        } else if(dealerValue <= 21 && dealerValue >= 17 && dealerValue > playerValue){
            stopUserInput()
            dealerWins = true
            
        } else if(playerValue > 21){
            stopUserInput()
            dealerWins = true
    
        } else if(dealerValue == playerValue){
            stopUserInput()
            draw = true
        }
        playedGamesCounter += 1
    }
    
    
    func checkForBlackJack(){
        if(playerValue == 21 || dealerValue == 21){
            blackJack = true
            stopUserInput()
        }
    }
    
    func checkForValueLimit(){
        if(playerValue > 21){
            dealerWins = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.resetCards()
                    }
        }
    }
    
    func win(){
        playerWins = true
        wonHandsCounter += 1
        getCash()
        progressValue += 0.1
        if(progressValue == 1.0){
            levelUp()
        }
    }
    
    func levelUp(){
        level += 1
        progressValue = 0.0
    }
    
    func dealersTurn(){
        showDealerCards = true
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
        playerCardStack.append(cards.removeFirst())
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
        checkForValueLimit()
    }
    
    func playerStandsWhileSplit(){
        
    }
    
    func playerStands(){
        if(handIsSplit){
            leftDeckIsActive = false
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
    
    
    //MARK: Google Firestore
    
    let db = Firestore.firestore()
    
    var user : User?{
        didSet{
          objectWillChange.send()
        }
      }
    
    
    func updateProfileData(){
        print("UpdateProfileData: " + currentUser.id!)
        db.collection("Profiles").document(currentUser.id!).setData(["playedGames": playedGamesCounter, "wonHands": wonHandsCounter, "level": level, "cash": currentUser.cash], merge: true)
    }
    
    func deleteProfileData(profileToDelete: Profile){
        db.collection("Profiles").document(user!.uid).delete()
    }
    
    func addProfileData(id: String, nickName: String, level: Int, playedGames: Int, wonHands: Int, cash: Int){
        db.collection("Profiles").document(id).setData(["nickName": nickName, "level": level, "playedGames": playedGames, "wonHands": wonHands, "cash": cash]) { error in
            if error == nil {
                self.getProfileData()
            } else {
                print (error!.localizedDescription)
            }
        }
    }
    
    func getCurrentUserProfile(){
        print("user in getCurrentUserProfile " + (user?.uid ?? "default value"))
        let ref = db.collection("Profiles").document(user!.uid)
        ref.getDocument{ document, error in
            print("getting Document: " + (document?.data()?.description ?? "default value"))
            guard (document != nil) else {return}
                let data = document!.data()
                let id = document!.documentID
                let nickName = data?["nickName"] as? String ?? ""
                let level = data?["level"] as? Int ?? 0
                let playedGames = data?["playedGames"] as? Int ?? 0
                let wonHands = data?["wonHands"] as? Int ?? 0
                let cash = data?["cash"] as? Int ?? 0
            
            self.nickName = nickName
            self.playedGamesCounter = playedGames
            self.wonHandsCounter = wonHands
            self.level = level
            self.cash = cash
                
                let profile = Profile(id: id, nickName: nickName, level: level, playedGames: playedGames, wonHands: wonHands, cash: cash)
                self.currentUser = profile
            print("getCurrentUserProfile: " + (self.currentUser.id?.description ?? "no ID found"))
        }
    }
    
    func getProfileData(){
        let ref = db.collection("Profiles")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = document.documentID
                    let nickName = data["nickName"] as? String ?? ""
                    let level = data["level"] as? Int ?? 0
                    let playedGames = data["playedGames"] as? Int ?? 0
                    let wonHands = data["wonHands"] as? Int ?? 0
                    let cash = data["cash"] as? Int ?? 0
                    
                    let profile = Profile(id: id, nickName: nickName, level: level, playedGames: playedGames, wonHands: wonHands, cash: cash)
                    self.profiles.append(profile)
                }
            }
        }
    }
    
    func didStateChange(){
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
              guard let self = self else{
                return
              }
            self.user = user
            print("vm didStateChange: " + (self.user?.description ?? "nope"))
            if(user != nil){
               
            }
        }
    }
    
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("vm signUp: " + (result?.description ?? "nope"))
                guard result != nil else {return}
                let id = result!.user.uid
                self.addProfileData(id: id, nickName: self.nickName, level: 0, playedGames: 0, wonHands: 0, cash: 6000)
            }
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func logout(){
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}
