//
//  Card.swift
//  Black Jack
//
//  Created by Timo Laspe on 01.03.23.
//

import Foundation

struct Card : Codable, Identifiable, Hashable{
    let id = UUID()
    var code : String
    var image : String
    var value : String
    var suit : String
}
