//
//  GameView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        
//MARK: BACKGROUND & ITEMS
        if (!viewModel.dataLoaded) {
            ZStack{
                Image("blackJackBackground")
                    .resizable()
                    .ignoresSafeArea()
                    Text("Loading")
                        .font(.custom(
                            "Copperplate",
                            fixedSize: 28))
                        .foregroundColor(Color.white)
            }
        } else {
            ZStack{
                Image("blackJackBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        Image("bannerOrange")
                            .resizable()
                            .frame(width: 100, height: 30)
                            .position(x: 50, y: 10)
                        Text("Level")
                            .position(x: 32, y: 9)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 16))
                            .bold()
                        Text("\(viewModel.levelCounter)")
                            .position(x: 75, y: 10)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 18))
                        Image("bannerRot")
                            .resizable()
                            .frame(width: 120, height: 40)
                            .position(x: 330, y: 10)
                        Text("\(viewModel.cash)")
                            .foregroundColor(Color.white)
                            .position(x: 330, y: 10)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 16))
                            .bold()
                        ProgressView(value: viewModel.progressValue)
                            .background(Color.white)
                            .tint(Color.orange)
                            .frame(width: 150)
                            .position(x: 172, y: 10)
                        if(viewModel.playerWins){
                            Text("WIN")
                                .foregroundColor(Color.orange)
                                .bold()
                                .position(x: 200, y: 380)
                                .font(.custom(
                                    "Copperplate",
                                    fixedSize: 98))
                        } else if (viewModel.dealerWins){
                            Text("BUST")
                                .foregroundColor(Color.orange)
                                .bold()
                                .position(x: 200, y: 380)
                                .font(.custom(
                                    "Copperplate",
                                    fixedSize: 98))
                        }
                    }
                    
    // MARK: IF PLAYER CANT BET
                    
                    
                    
          // MARK: DEALERS STACK
                    
                    if(!viewModel.playerCanBet){
                        VStack(spacing: 100){
                            VStack(){
                                if(viewModel.dealersCardsCounter == 2){
                                    HStack(spacing: -50){
                                        AsyncImage(url: URL(string: viewModel.cards.randomElement()!.image)) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                    }
                                } else if (viewModel.dealersCardsCounter == 3){
                                    HStack(spacing: -60){
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                    }
                                } else if (viewModel.dealersCardsCounter == 4){
                                    HStack(spacing: -70){
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                    }
                                } else if (viewModel.dealersCardsCounter == 5){
                                    HStack(spacing: -80){
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                        AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 100, height: 150)
                                    }
                                }
                                Text("\(viewModel.dealerValue)")
                                    .frame(width:40,height: 40)
                                    .bold()
                                    .font(.system(size: 24))
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                            .padding()
                            
                            Spacer()
                            
    // MARK: IF HAND ISNT SPLIT
                            
                            
                            
       //MARK: PLAYERS STACK
                            
                            if(!viewModel.handIsSplit){
                                VStack(){
                                    Text("\(viewModel.playerValue)")
                                        .frame(width:40,height: 40)
                                        .bold()
                                        .font(.system(size: 24))
                                        .background(Color.white)
                                        .clipShape(Circle())
                                    if(viewModel.playersCardsCounter == 2){
                                        HStack(spacing: -50){
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                        }
                                    } else if (viewModel.playersCardsCounter == 3){
                                        HStack(spacing: -60){
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                        }
                                    } else if (viewModel.playersCardsCounter == 4){
                                        HStack(spacing: -70){
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                        }
                                    } else if (viewModel.playersCardsCounter == 5){
                                        HStack(spacing: -80){
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                        }
                                    }
                                }
                                .padding()
                            } else {
                                
    // MARK: IF HAND IS SPLIT
                                
                                HStack{
                                    
                                    Spacer()
                                    
    // MARK: LEFT STACK
                                    
                                    VStack(){
                                        Text("\(viewModel.splitDeckValueLeft)")
                                            .frame(width:40,height: 40)
                                            .bold()
                                            .font(.system(size: 24))
                                            .background(Color.white)
                                            .clipShape(Circle())
                                        if(viewModel.splitCardsCounterLeft == 1){
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 80, height: 110)
                                        } else if(viewModel.splitCardsCounterLeft == 2){
                                            HStack(spacing: -60){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        } else if (viewModel.splitCardsCounterLeft == 3){
                                            HStack(spacing: -70){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        } else if (viewModel.splitCardsCounterLeft == 4){
                                            HStack(spacing: -70){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        } else if (viewModel.splitCardsCounterLeft == 5){
                                            HStack(spacing: -70){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        }
                                    }
                                    .padding()
                                    
                                    Spacer()
                                    
    // MARK: RIGHT STACK
                                    
                                    VStack(){
                                        Text("\(viewModel.splitDeckValueRight)")
                                            .frame(width:40,height: 40)
                                            .bold()
                                            .font(.system(size: 24))
                                            .background(Color.white)
                                            .clipShape(Circle())
                                        if(viewModel.splitCardsCounterRight == 1){
                                            AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 80, height: 110)
                                        } else if(viewModel.splitCardsCounterRight == 2){
                                            HStack(spacing: -60){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        } else if (viewModel.splitCardsCounterRight == 3){
                                            HStack(spacing: -70){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        } else if (viewModel.splitCardsCounterRight == 4){
                                            HStack(spacing: -70){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        } else if (viewModel.splitCardsCounterRight == 5){
                                            HStack(spacing: -70){
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                                AsyncImage(url: URL(string: "https://deckofcardsapi.com/static/img/8H.png")) { image in
                                                            image
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                
                                                        } placeholder: {
                                                            Color.gray
                                                        }
                                                        .frame(width: 80, height: 110)
                                            }
                                        }
                                    }
                                    .padding()
                                    
                                    Spacer()
                                }
                            }
                        }
                        
    // MARK: BUTTONS IF PLAYER CANT SPLIT
                        
                        if(!viewModel.playerCanSplit){
                            HStack{
                                
                                Spacer()
                                
                                Button(action:{
                                    viewModel.playerHits()
                                }){
                                    Text("Hit")
                                        .font(.custom(
                                            "Copperplate",
                                            fixedSize: 18))
                                        .bold()
                                }
                                .frame(width: 75, height: 40)
                                .foregroundColor(Color.white)
                                .background(Color.green)
                                .cornerRadius(25)
                                
                                Spacer()
                                
                                Button(action:{
                                    viewModel.playerStands()
                                }){
                                    Text("Stand")
                                        .font(.custom(
                                            "Copperplate",
                                            fixedSize: 18))
                                        .bold()
                                }
                                .frame(width: 75, height: 40)
                                .foregroundColor(Color.white)
                                .background(Color.red)
                                .cornerRadius(25)
                                
                                Spacer()
                                
                                if(viewModel.playerCanDouble){
                                    Button(action:{
                                        viewModel.doubleBet()
                                    }){
                                        Text("Double")
                                            .font(.custom(
                                                "Copperplate",
                                                fixedSize: 18))
                                            .bold()
                                    }
                                    .frame(width: 75, height: 40)
                                    .foregroundColor(Color.white)
                                    
                                    .background(Color.blue)
                                    .cornerRadius(25)
                                    Spacer()
                                }
                            }
                        } else {
                            
    //MARK: BUTTONS IF PLAYER CAN SPLIT
                            
                            HStack{
                                Spacer()
                                Button(action:{
                                    viewModel.playerHits()
                                }){
                                    Text("Hit")
                                        .font(.custom(
                                            "Copperplate",
                                            fixedSize: 18))
                                        .bold()
                                }
                                .frame(width: 75, height: 40)
                                .foregroundColor(Color.white)
                                
                                .background(Color.green)
                                .cornerRadius(25)
                                Spacer()
                                Button(action:{
                                    viewModel.playerStands()
                                }){
                                    Text("Stand")
                                        .font(.custom(
                                            "Copperplate",
                                            fixedSize: 18))
                                        .bold()
                                }
                                .frame(width: 75, height: 40)
                                .foregroundColor(Color.white)
                                
                                .background(Color.red)
                                .cornerRadius(25)
                                Spacer()
                                Button(action:{
                                    viewModel.doubleBet()
                                }){
                                    Text("Double")
                                        .font(.custom(
                                            "Copperplate",
                                            fixedSize: 18))
                                        .bold()
                                }
                                .frame(width: 75, height: 40)
                                .foregroundColor(Color.white)
                                
                                .background(Color.blue)
                                .cornerRadius(25)
                                
                                Spacer()
                                
                                Button(action:{
                                    viewModel.playerSplits()
                                }){
                                    Text("Split")
                                        .font(.custom(
                                            "Copperplate",
                                            fixedSize: 18))
                                        .bold()
                                }
                                .frame(width: 75, height: 40)
                                .foregroundColor(Color.black)
                                .background(Color.yellow)
                                .cornerRadius(25)
                                Spacer()
                            }
                        }
                    } else {
                        
    // MARK: IF PLAYER CAN BET
                        
                        VStack(spacing: 30){
                            Text("Einsatz wählen")
                                .font(.custom(
                                    "Copperplate",
                                    fixedSize: 24))
                                .foregroundColor(Color.white)
                                .bold()
                            HStack{
                                ZStack{
                                    Image("chipRot")
                                        .resizable()
                                        .frame(width:60, height: 60)
                                    Text("50")
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                                ZStack{
                                    Image("chipWeiss")
                                        .resizable()
                                        .frame(width:60, height: 60)
                                    Text("100")
                                        .bold()
                                }
                                ZStack{
                                    Image("chipBlau")
                                        .resizable()
                                        .frame(width:60, height: 60)
                                    Text("150")
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                                ZStack{
                                    Image("chipGruen")
                                        .resizable()
                                        .frame(width:60, height: 60)
                                    Text("200")
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                                ZStack{
                                    Image("chipSchwarz")
                                        .resizable()
                                        .frame(width:60, height: 60)
                                    Text("250")
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


