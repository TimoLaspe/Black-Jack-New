//
//  GameView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    
    var body: some View {
        GeometryReader{
            geometry in
            
//MARK: BACKGROUND & ITEMS
            
            if (!viewModel.dataLoaded || !viewModel.gameIsSet) {
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
                            Group{
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
                                Text("\(viewModel.currentUser.level)")
                                    .position(x: 75, y: 10)
                                    .font(.custom(
                                        "Copperplate",
                                        fixedSize: 18))
                                Image("bannerRot")
                                    .resizable()
                                    .frame(width: 120, height: 40)
                                    .position(x: 330, y: 10)
                                Text("\(viewModel.currentUser.cash)")
                                    .foregroundColor(Color.white)
                                    .position(x: 330, y: 10)
                                    .font(.custom(
                                        "Copperplate",
                                        fixedSize: 16))
                                    .bold()
                                ProgressView(value: viewModel.progressValue, total: 1.0)
                                    .background(Color.white)
                                    .tint(Color.orange)
                                    .frame(width: 150)
                                    .position(x: 172, y: 10)
                            }
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
                            } else if (viewModel.draw){
                                Text("DRAW")
                                    .foregroundColor(Color.orange)
                                    .bold()
                                    .position(x: 200, y: 380)
                                    .font(.custom(
                                        "Copperplate",
                                        fixedSize: 98))
                            } else if (viewModel.isShuffling){
                                Text("SHUFFLE")
                                    .foregroundColor(Color.orange)
                                    .bold()
                                    .position(x: 200, y: 380)
                                    .font(.custom(
                                        "Copperplate",
                                        fixedSize: 68))
                            }
                        }
                        
// MARK: IF PLAYER CANT BET
                        
                        
                        
// MARK: DEALERS STACK
                        
                        if(!viewModel.playerCanBet){
                            VStack(spacing: 100){
                                VStack(){
                                    
                                    HStack(spacing: -70){
                                        ForEach(viewModel.dealerCardStack){ card in
                                            if(!viewModel.showDealerCards){
                                                Image("CardBackside")
                                                    .resizable()
                                                    .frame(width: 100, height: 150)
                                                    .aspectRatio(contentMode: .fill)
                                                    .shadow(radius: 25)
                                            } else {
                                                AsyncImage(url: URL(string: card.image)) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                    
                                                } placeholder: {
                                                    Image("CardBackside")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .shadow(radius: 25)
                                                }
                                                .frame(width: 100, height: 150)
                                            }
                                        }
                                    }
                                    if(viewModel.showDealerCards){
                                        Text("\(viewModel.dealerValue)")
                                            .frame(width:40,height: 40)
                                            .bold()
                                            .font(.system(size: 24))
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    } else {
                                        Text("?")
                                            .frame(width:40,height: 40)
                                            .bold()
                                            .font(.system(size: 24))
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    }
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
                                        
                                        HStack(spacing: -70){
                                            ForEach(viewModel.playerCardStack){ card in
                                                AsyncImage(url: URL(string: card.image)) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                    
                                                } placeholder: {
                                                    Image("CardBackside")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .shadow(radius: 25)
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
                                            HStack(spacing: -70){
                                                ForEach(viewModel.leftCardStack){ card in
                                                    AsyncImage(url: URL(string: card.image)) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                        
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 100, height: 150)
                                                }
                                            }                                    }
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
                                            HStack(spacing: -70){
                                                ForEach(viewModel.rightCardStack){ card in
                                                    AsyncImage(url: URL(string: card.image)) { image in
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
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
// MARK: BUTTONS IF PLAYER CANT SPLIT
                            
                            if(!viewModel.playerCanSplit){
                                HStack{
                                    
                                    Spacer()
                                    
                                    Button(action:{
                                        if(viewModel.inputAvailable){
                                            viewModel.playerHits()
                                        }
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
                                        if(viewModel.inputAvailable){
                                            viewModel.playerStands()
                                        }
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
                                            if(viewModel.inputAvailable){
                                                viewModel.doubleBet()
                                            }
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
                                        if(viewModel.inputAvailable){
                                            viewModel.playerHits()
                                        }
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
                                        if(viewModel.inputAvailable){
                                            viewModel.playerStands()
                                        }
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
                                        if(viewModel.inputAvailable){
                                            viewModel.doubleBet()
                                        }
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
                                        if(viewModel.inputAvailable){
                                            viewModel.playerSplits()
                                        }
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
                                    
                                    Button(action:{
                                        viewModel.setPlayersBet(value: 50)
                                    }){
                                        ZStack{
                                            Image("chipRot")
                                                .resizable()
                                                .frame(width:60, height: 60)
                                            Text("50")
                                                .foregroundColor(Color.white)
                                                .bold()
                                        }
                                    }
                                    Button(action:{
                                        viewModel.setPlayersBet(value: 100)
                                    }){
                                        ZStack{
                                            Image("chipWeiss")
                                                .resizable()
                                                .frame(width:60, height: 60)
                                            Text("100")
                                                .bold()
                                        }
                                    }
                                    Button(action:{
                                        viewModel.setPlayersBet(value: 150)
                                    }){
                                        ZStack{
                                            Image("chipBlau")
                                                .resizable()
                                                .frame(width:60, height: 60)
                                            Text("150")
                                                .foregroundColor(Color.white)
                                                .bold()
                                        }
                                        
                                    }
                                    Button(action:{
                                        viewModel.setPlayersBet(value: 200)
                                    }){
                                        ZStack{
                                            Image("chipGruen")
                                                .resizable()
                                                .frame(width:60, height: 60)
                                            Text("200")
                                                .foregroundColor(Color.white)
                                                .bold()
                                        }
                                        
                                        
                                    }
                                    Button(action:{
                                        viewModel.setPlayersBet(value: 250)
                                    }){
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
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}


