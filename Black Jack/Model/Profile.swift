//
//  Profile.swift
//  Black Jack
//
//  Created by Timo Laspe on 13.03.23.
//

import Foundation

struct Profile : Identifiable{
    let id = UUID()
    var nickName : String = ""
    var playedGames : Int = 0
    var wonHands : Int = 0
    var cash : Int = 0
}
