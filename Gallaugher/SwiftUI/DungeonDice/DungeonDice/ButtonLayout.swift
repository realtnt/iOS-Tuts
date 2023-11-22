//
//  ButtonLayout.swift
//  DungeonDice
//
//  Created by Theo Ntogiakos on 22/11/2023.
//

import SwiftUI

struct ButtonLayout: View {
    @State private var remainingButtons = 0
    @State private var roll = 0
    @State private var currentDice: Dice = .four
    @Binding var resultMessage: String
    
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 30
    let buttonWidth: CGFloat = 102
    
    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: buttonWidth))
        ]
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(Dice.allCases.dropLast(remainingButtons), id: \.self) { dice in
                    Button("\(dice.rawValue) sided") {
                        currentDice = dice
                        roll = currentDice.roll
                        resultMessage = "You rolled a \(roll)\non a \(currentDice.rawValue)-sided dice."
                    }                    }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            
            HStack {
                ForEach(Dice.allCases.suffix(remainingButtons), id: \.self) { dice in
                    Button("\(dice.rawValue) sided") {
                        currentDice = dice
                        roll = currentDice.roll
                        resultMessage = "You rolled a \(roll)\non a \(currentDice.rawValue)-sided dice."
                    }                    }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
        }
        .overlay {
            GeometryReader { geo in
                Color.clear
                    .preference(key: DeviceWidthPreferenceKey.self, value: geo.size.width)
            }
        }
        .onPreferenceChange(DeviceWidthPreferenceKey.self) { deviceWidth in
            remainingButtons = Dice.allCases.count % (Int(deviceWidth) / Int(buttonWidth))
        }
    }
}

#Preview {
    ButtonLayout(resultMessage: .constant(""))
}
