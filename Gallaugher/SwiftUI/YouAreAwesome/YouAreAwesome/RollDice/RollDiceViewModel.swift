//
//  RollDiceViewModel.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 12/11/2023.
//

import Foundation

class RollDiceViewModel: ObservableObject {
    @Published var rolls = [Dice]()
    
    func rollDice(times: Int, sides: Int) {
        print(times, sides)
        rolls.removeAll()
        for _ in 1...times {
            rolls.append( Dice(value: Int.random(in: (1...sides))) )
        }
        print(rolls)
    }
}
