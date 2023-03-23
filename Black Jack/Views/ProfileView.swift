//
//  ProfileView.swift
//  Black Jack
//
//  Created by Timo Laspe on 22.02.23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = GameViewModel(profileViewModel: ProfileViewModel())
    
    var body: some View {
        ZStack{
                Image("BackgroundWithItems")
                    .resizable()
                    .ignoresSafeArea()
            
            Group{
                Text("Manni 95")
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
                Text("25")
                    .position(x:340, y: 47)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 28))
                }
            
            Group{
                Text("Statistiken")
                    .position(x:120, y: 205)
                    .foregroundColor(Color.orange)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 34))
                Text("Spiele insgesamt")
                    .position(x:126, y: 250)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Text("Gewonnene Hände")
                    .position(x:133, y: 285)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Text("Kontostand")
                    .position(x:93, y: 320)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Text("136")
                    .position(x:340, y: 250)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Text("102")
                    .position(x:340, y: 285)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Text("5394")
                    .position(x:333, y: 320)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
            }
            
            Group{
                Text("Einstellungen")
                    .position(x:150, y: 375)
                    .foregroundColor(Color.orange)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 34))
                Text("Spiel Zurücksetzen")
                    .position(x:142, y: 455)
                    .foregroundColor(Color.red)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
                Text("Musik an / Aus")
                    .position(x:108, y: 420)
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 24))
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
