//
//  HighscoreView.swift
//  Black Jack
//
//  Created by Timo Laspe on 24.02.23.
//

import SwiftUI

struct HighscoreView: View {
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
                List{
                    Text("Hallo")
                    Text("Moin")
                    Text("Servus")
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
