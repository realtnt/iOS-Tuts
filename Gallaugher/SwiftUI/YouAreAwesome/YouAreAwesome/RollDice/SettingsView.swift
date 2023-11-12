//
//  SettingsView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 12/11/2023.
//

import SwiftUI

struct SettingsView: View {
    @Binding var numberOfRolls: Int
    @Binding var numberOfSides: Int
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text("Number of Rolls")
                    Picker("Number of Rolls", selection: $numberOfRolls) {
                        ForEach((1...20), id: \.self) {
                            Text("\($0)").tag($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                VStack {
                    Text("Dice Sides")
                    Picker("Dice Sides", selection: $numberOfSides) {
                        ForEach((4...10), id: \.self) {
                            Text("\($0)").tag($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .padding(.bottom, 50)
        }
    }
}

#Preview {
    SettingsView(numberOfRolls: .constant(5), numberOfSides: .constant(7))
}
