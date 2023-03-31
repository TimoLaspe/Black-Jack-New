//
//  ContentView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI
import Firebase


struct ContentView: View {
    
    @StateObject var viewModel: GameViewModel = GameViewModel()
    
    @State var testMode = false
    
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
                            viewModel.user = user?.uid
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
