//
//  ProfileView.swift
//  Black Jack
//
//  Created by Timo Laspe on 22.02.23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel : GameViewModel
    
    var body: some View {
        ZStack{
                Image("BackgroundWithItems")
                    .resizable()
                    .ignoresSafeArea()
            
            Group{
                Text("\(viewModel.currentUser.nickName)")
                    .position(x: 280, y: 130)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 42))
                Image("bannerOrange")
                    .resizable()
                    .frame(width: 130, height: 60)
                    .rotationEffect(.degrees(-180))
                    .position(x: 330, y: 35)
            }
            
            Group{
                Text("Level")
                    .position(x:340, y: 22)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 28))
                Text("\(viewModel.currentUser.level)")
                    .position(x:340, y: 47)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 28))
                }
            
           
                Text("Statistiken")
                    .position(x:127, y: 190)
                    .foregroundColor(Color.orange)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 34))
                VStack(spacing: -20){
                    HStack{
                        Text("Spiele insgesamt")
                            .foregroundColor(Color.white)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 22))
                        Spacer()
                        Text("\(viewModel.currentUser.playedGames)")
                            .foregroundColor(Color.white)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 22))
                    }.padding()
                    
                    HStack{
                        Text("Gewonnene Hände")
                            .foregroundColor(Color.white)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 22))
                        Spacer()
                        Text("\(viewModel.currentUser.wonHands)")
                            
                            .foregroundColor(Color.white)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 22))
                    }
                    .padding()
                    
                    HStack{
                        Text("Kontostand")
                            .foregroundColor(Color.white)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 22))
                        Spacer()
                        Text("\(viewModel.currentUser.cash)")
                            .foregroundColor(Color.white)
                            .font(.custom(
                                "Copperplate",
                                fixedSize: 22))
                    }
                    .padding()
                }
                .padding()
                .position(x: 195, y: 270)
            
            Group{
                Text("Einstellungen")
                    .position(x:158, y: 375)
                    .foregroundColor(Color.orange)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 34))
                Text("Spiel Zurücksetzen")
                    .position(x:150, y: 455)
                    .foregroundColor(Color.red)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Text("Musik an / Aus")
                    .position(x:116, y: 420)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Button("Abmelden"){
                    viewModel.logout()
                }
                    .position(x:104, y: 520)
                    .foregroundColor(Color.green)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 30))
                Toggle(isOn: $viewModel.musicIsOn){
                    
                }
                .tint(.orange)
                .position(x:165, y: 420)
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
