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
            VStack{
                if viewModel.user != nil {
                    HomeView().onAppear{
                        print("onAppaer in ContentView")
                        if(viewModel.user != nil){
                            viewModel.getCurrentUserProfile()
                        }
                    }
                } else {
                    VStack{
                        LoginView()
                    }
                    .onAppear{
                        viewModel.didStateChange()
                    }
                }
                }.environmentObject(viewModel)
            } else {
                GameView().environmentObject(viewModel)
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
