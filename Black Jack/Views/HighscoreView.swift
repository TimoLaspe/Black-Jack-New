//
//  HighscoreView.swift
//  Black Jack
//
//  Created by Timo Laspe on 24.02.23.
//

import SwiftUI
import Firebase

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
                List (viewModel.profiles){ item in
                    Text(item.nickName)
                }
                .scrollContentBackground(.hidden)
                .position(x: 196, y: -20)
            }
        }
    }
}

struct HighscoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighscoreView()
    }
}
