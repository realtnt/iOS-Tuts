//
//  ContentView.swift
//  DungeonDice
//
//  Created by Theo Ntogiakos on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var resultMessage = ""
    
    var body: some View {
        VStack {
            titleView
            
            Spacer()
            
            resultMessageView
            
            Spacer()
            
            ButtonLayout(resultMessage: $resultMessage)
        }
    }
}

extension ContentView {
    private var titleView: some View {
        Text("Dungeon Dice")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.red)
    }
    
    private var resultMessageView: some View {
        Text(resultMessage)
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .frame(height: 150)
    }
}

struct DeviceWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    typealias Value = CGFloat
}

#Preview {
    ContentView()
}
