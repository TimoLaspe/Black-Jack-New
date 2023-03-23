//
//  Profile.swift
//  Black Jack
//
//  Created by Timo Laspe on 13.03.23.
//

import Foundation

struct Profile : Identifiable {
    let id : String
    var nickName : String
    var level : Int
    var playedGames : Int
    var wonHands : Int
    var cash : Int 
}
