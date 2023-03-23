//
//  Black_JackApp.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI
import Firebase

@main
struct Black_JackApp: App {
    
    @StateObject var viewModel = ProfileViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
