//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 11/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var awesome = false
    @State private var imageIndex = 0
    private var images = ["swift", "iphone", "macpro.gen1", "macpro.gen2", "macbook", "ipad", "swiftdata"]
    private var greatMessage = "You Are Great!"
    private var awesomeMessage = "You Are Awesome!"
    var body: some View {
        VStack {
            Image(systemName: images[abs(imageIndex % images.count)])
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundStyle(.orange)
                .padding(50)
                .background(.black)
                .cornerRadius(15)
                .padding(30)
            
            Text(awesome ? awesomeMessage : greatMessage)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Toggle("Awesome?", isOn: $awesome)
            
            HStack {
                Button("Index Up") {
                    imageIndex += 1
                }
                .buttonStyle(.borderedProminent)
                    
                Button("Index Down") {
                    imageIndex -= 1
                }
                .buttonStyle(.borderedProminent)
            }
            Text("\(imageIndex)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
