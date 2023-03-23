//
//  HomeView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = GameViewModel(profileViewModel: ProfileViewModel())
    
    var body: some View {
        NavigationView{
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
                Text("\(viewModel.levelCounter)")
                    .position(x:340, y: 47)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 28))
                VStack(spacing: 30){
                    
                   
                    NavigationLink("Schnelles Spiel", destination:
                                    GameView().navigationBarBackButtonHidden(true))
                        .frame(width: 260, height: 25)
                                            .foregroundColor(Color.black)
                                            .padding()
                                            .background(Color.orange)
                                            .cornerRadius(15)
                                            .font(.custom(
                                                "Copperplate",
                                                fixedSize: 24))
                                            .bold()
                                            
                    
                    
                    NavigationLink("Profil", destination:
                                    ProfileView().navigationBarBackButtonHidden(true))
                         .frame(width: 260, height: 25)
                                             .foregroundColor(Color.black)
                                             .padding()
                                             .background(Color.orange)
                                             .cornerRadius(15)
                                             .font(.custom(
                                                 "Copperplate",
                                                 fixedSize: 24))
                                             .bold()
                    
                    NavigationLink("Highscores", destination:
                                    HighscoreView().navigationBarBackButtonHidden(true))
                         .frame(width: 260, height: 25)
                                             .foregroundColor(Color.black)
                                             .padding()
                                             .background(Color.orange)
                                             .cornerRadius(15)
                                             .font(.custom(
                                                 "Copperplate",
                                                 fixedSize: 24))
                                             .bold()
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
