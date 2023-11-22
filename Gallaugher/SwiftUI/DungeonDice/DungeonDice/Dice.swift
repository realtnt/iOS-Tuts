//
//  Dice.swift
//  DungeonDice
//
//  Created by Theo Ntogiakos on 20/11/2023.
//

import Foundation

enum Dice: Int, CaseIterable {
    case four = 4
    case six = 6
    case eight = 8
    case ten = 10
    case twelve = 12
    case twenty = 20
    case fifty = 50
    case hundred = 100
    
    var roll: Int {
        return Int.random(in: 1...self.rawValue)
    }
}
