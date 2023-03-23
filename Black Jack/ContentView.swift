//
//  ContentView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI
import Firebase


struct ContentView: View {
    
    @StateObject var viewModel: GameViewModel = GameViewModel(profileViewModel: ProfileViewModel())
    
    @State var testMode = true
    
    var body: some View {
        if !testMode{
            if viewModel.userIsLoggedIn {
                HomeView()
            } else {
                VStack{
                    LoginView()
                }
                .onAppear{
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            viewModel.userIsLoggedIn.toggle()
                        }
                    }
                }
            }
        } else {
            GameView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
