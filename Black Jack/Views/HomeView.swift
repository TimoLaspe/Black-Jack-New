//
//  HomeView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Image("BackgroundWithItems")
                .resizable()
                .ignoresSafeArea()
            Text("Willkommen,")
                .position(x: 285, y: 90)
                .foregroundColor(Color.white)
                .font(.custom(
                        "Copperplate",
                        fixedSize: 20))
            Text("Manni 95")
                .position(x: 270, y: 125)
                .foregroundColor(Color.white)
                .font(.custom(
                    "Copperplate",
                    fixedSize: 42))
                Image("bannerOrange")
                    .resizable()
                    .frame(width: 130, height: 60)
                    .rotationEffect(.degrees(-180))
                    .position(x: 330, y: 35)
            Text("Level")
                .position(x:340, y: 22)
                .font(.custom(
                    "Copperplate",
                    fixedSize: 28))
            Text("25")
                .position(x:340, y: 47)
                .font(.custom(
                    "Copperplate",
                    fixedSize: 28))
            VStack(spacing: 30){
                
                NavigationLink(destination: GameView()){
                    Button(action:{
                        
                    }){
                        Text("Schnelles Spiel")
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 24))
                            .bold()
                    }
                    
                    .frame(width: 260, height: 25)
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(15)
                }
                
                NavigationLink(destination: ProfileView()){
                    Button(action:{
                        
                    }){
                        
                        Text("Profil")
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 24))
                            .bold()
                        
                    }
                    .frame(width: 260, height: 25)
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(15)
                }
                Button(action:{
                    
                }){
                    
                    Text("Highscores")
                        .font(.custom(
                            "Copperplate",
                            fixedSize: 24))
                        .bold()
                    
                }
                .frame(width: 260, height: 25)
                .foregroundColor(Color.black)
                .padding()
                .background(Color.orange)
                .cornerRadius(15)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
