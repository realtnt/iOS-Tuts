//
//  RollDiceView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 12/11/2023.
//

import SwiftUI

struct RollDiceView: View {
    @StateObject var vm = RollDiceViewModel()
    @State private var numberOfRolls = 1
    @State private var numberOfSides = 6
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button("Roll the dice") {
                    vm.rollDice(times: numberOfRolls, sides: numberOfSides)
                }
                .buttonStyle(.borderedProminent)
            }
            
            SettingsView(numberOfRolls: $numberOfRolls, numberOfSides: $numberOfSides)
            
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(vm.rolls) { item in
                        Image(systemName: "\(item.value).square.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.indigo)
                            .frame(width: 80)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    RollDiceView()
}
