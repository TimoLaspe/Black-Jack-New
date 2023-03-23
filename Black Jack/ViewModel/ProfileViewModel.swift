//
//  ProfileViewModel.swift
//  Black Jack
//
//  Created by Timo Laspe on 22.03.23.
//

import Foundation
import Firebase

@MainActor class ProfileViewModel: ObservableObject {
    
    @Published var profiles : [Profile] = []
    @Published var cash : Int = 6000
    @Published var playedGamesCounter : Int = 0
    @Published var wonHandsCounter : Int = 0
    @Published var nickName : String = ""
    @Published var wonhandsCounter: Int = 0
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var level : Int = 0
    
    init(){
        getProfileData()
    }
    
    func updateProfileData(profileToUpdate: Profile){
        let db = Firestore.firestore()
        db.collection("Profiles").document(profileToUpdate.id).setData(["playedGamesCounter": playedGamesCounter, "wonHands": wonHandsCounter, "level": level, "cash": cash], merge: true)
    }
    
    func deleteProfileData(profileToDelete: Profile){
        let db = Firestore.firestore()
        db.collection("Profiles").document(profileToDelete.id).delete()
    }
    
    func addProfileData(nickName: String, level: Int, playedGames: Int, wonHands: Int, cash: Int){
        let db = Firestore.firestore()
        db.collection("Profiles").addDocument(data: ["nickName": nickName, "level": level, "playedGames": playedGames, "wonHands": wonHands, "cash": cash]) { error in
            if error == nil {
                self.getProfileData()
            } else {
                print (error!.localizedDescription)
            }
        }
    }
    
    func getProfileData(){
        let db = Firestore.firestore()
        let ref = db.collection("Profiles")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = document.documentID
                    let nickName = data["nickName"] as? String ?? ""
                    let level = data["level"] as? Int ?? 0
                    let playedGames = data["playedGames"] as? Int ?? 0
                    let wonHands = data["wonHands"] as? Int ?? 0
                    let cash = data["cash"] as? Int ?? 0
                    
                    let profile = Profile(id: id, nickName: nickName, level: level, playedGames: playedGames, wonHands: wonHands, cash: cash)
                    self.profiles.append(profile)
                }
            }
        }
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}
