//
//  GameViewModel.swift
//  Black Jack
//
//  Created by Timo Laspe on 18.02.23.
//

import Foundation

@MainActor class GameViewModel: ObservableObject{
    
    @Published var playerCanSplit : Bool = true
    @Published var handIsSplit : Bool = false
    @Published var playerCanBet : Bool = false
    @Published var playerCanDouble : Bool = false
    @Published var dealersCardsCounter : Int = 2
    @Published var playersCardsCounter : Int = 2
    @Published var dealerValue : Int = 0
    @Published var playerValue : Int = 0
    @Published var splitDeckValueLeft : Int = 0
    @Published var splitDeckValueRight : Int = 0
    @Published var playerWins : Bool = false
    @Published var dealerWins : Bool = false
    @Published var levelCounter : Int = 26
    @Published var cash : Int = 6000
    @Published var progressValue: Float = 0.8
    @Published var musicIsOn : Bool = true
    
    func delayNextDealerCard() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
}
