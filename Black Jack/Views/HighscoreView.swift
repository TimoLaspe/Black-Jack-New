//
//  HighscoreView.swift
//  Black Jack
//
//  Created by Timo Laspe on 24.02.23.
//

import SwiftUI
import Firebase
import AVKit

struct HighscoreView: View {
    
    @EnvironmentObject var viewModel: GameViewModel 
    
    var body: some View {
        ZStack{
            Image("BackgroundWithItems")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Highscores")
                    .position(x: 270, y: 125)
                    .foregroundColor(Color.orange)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 35))
                List (viewModel.sortedProfiles){ item in
                    HStack{
                        Text(item.nickName)
                        Spacer()
                        Text("\(item.cash)")
                    }
                }
                .scrollContentBackground(.hidden)
                .position(x: 196, y: -20)
            }
            NavigationLink("Menü", destination:
                            HomeView().navigationBarBackButtonHidden(true))
                .frame(width: 70, height: 10)
                                    .foregroundColor(Color.black)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(15)
                                    .font(.custom(
                                        "Copperplate",
                                        fixedSize: 20))
                                    .bold()
            .position(x:80, y:740)
        }
    }
}

struct HighscoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighscoreView().environmentObject(GameViewModel())
    }
}
