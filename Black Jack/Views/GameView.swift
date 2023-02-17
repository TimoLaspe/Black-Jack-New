//
//  GameView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
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
                if(!viewModel.playerCanBet){
                    VStack(spacing: 100){
                        VStack(){
                            if(viewModel.dealersCardsCounter == 2){
                                HStack(spacing: -50){
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                }
                            } else if (viewModel.dealersCardsCounter == 3){
                                HStack(spacing: -50){
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                }
                            } else if (viewModel.dealersCardsCounter == 4){
                                HStack(spacing: -50){
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                }
                            } else if (viewModel.dealersCardsCounter == 5){
                                HStack(spacing: -50){
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    Image("cardDummy")
                                        .resizable()
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
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
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                    }
                                } else if (viewModel.playersCardsCounter == 3){
                                    HStack(spacing: -50){
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                    }
                                } else if (viewModel.playersCardsCounter == 4){
                                    HStack(spacing: -50){
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                    }
                                } else if (viewModel.playersCardsCounter == 5){
                                    HStack(spacing: -50){
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                        Image("cardDummy")
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding()
                        } else {
                            HStack{
                                Spacer()
                                VStack(){
                                    Text("\(viewModel.playerValue)")
                                        .frame(width:40,height: 40)
                                        .bold()
                                        .font(.system(size: 24))
                                        .background(Color.white)
                                        .clipShape(Circle())
                                    if(viewModel.playersCardsCounter == 2){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    } else if (viewModel.playersCardsCounter == 3){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    } else if (viewModel.playersCardsCounter == 4){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    } else if (viewModel.playersCardsCounter == 5){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                .padding()
                                Spacer()
                                VStack(){
                                    Text("\(viewModel.playerValue)")
                                        .frame(width:40,height: 40)
                                        .bold()
                                        .font(.system(size: 24))
                                        .background(Color.white)
                                        .clipShape(Circle())
                                    if(viewModel.playersCardsCounter == 2){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    } else if (viewModel.playersCardsCounter == 3){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    } else if (viewModel.playersCardsCounter == 4){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    } else if (viewModel.playersCardsCounter == 5){
                                        HStack(spacing: -50){
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                            Image("cardDummy")
                                                .resizable()
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                .padding()
                                Spacer()
                            }
                        }
                    }
                    if(!viewModel.playerCanSplit){
                        HStack{
                            Spacer()
                            Button(action:{
                                viewModel.playerCanSplit = false
                                viewModel.playerCanDouble = false
                                viewModel.playersCardsCounter += 1
                                viewModel.delayNextDealerCard()
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
                        HStack{
                            Spacer()
                            Button(action:{
                                viewModel.playerCanSplit = false
                                viewModel.playerCanDouble = false
                                viewModel.playersCardsCounter += 1
                                viewModel.delayNextDealerCard()
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
                                viewModel.handIsSplit = true
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
