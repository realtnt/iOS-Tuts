//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 11/11/2023.
//

import SwiftUI

class YouAreAwesomeViewModel: ObservableObject {
    @Published var randomColor = Color.red
    @Published var randomImage = "swift"
    private var images = ["swift", "iphone", "macpro.gen1", "macpro.gen2", "macbook", "ipad", "swiftdata"]
    
    func setRandomImage() {
        randomImage = images[Int.random(in: 0..<images.count)]
    }
    
    func setRandomColor() {
        randomColor = Color(
            hue: Double.random(in: 0...1),
            saturation: Double.random(in: 0...1),
            brightness: Double.random(in: 0...1)
        )
    }
}

struct YouAreAwesomeView: View {
    @StateObject var vm = YouAreAwesomeViewModel()
    @State private var awesome = false
    
    private var greatMessage = "You Are Great!"
    private var awesomeMessage = "You Are Awesome!"
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.gradient)
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack {
                    Image(systemName: vm.randomImage )
                        .resizable()
                        .scaledToFit()
                        .frame(height: geometry.size.height * (0.25))
                        .foregroundStyle(.orange)
                        .padding(50)
                        .background(vm.randomColor)
                        .cornerRadius(15)
                        .padding(50)
                    
                    Spacer()
                    Text(awesome ? awesomeMessage : greatMessage)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(vm.randomColor)
                    
                    Spacer()
                    
                    Toggle("Awesome?", isOn: $awesome)
                        .foregroundStyle(vm.randomColor)
                    
                    HStack {
                        Button("Get Random Image") {
                            vm.setRandomImage()
                        }
                        .buttonStyle(.borderedProminent)
                            
                        Button("Get Random Color") {
                            vm.setRandomColor()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    YouAreAwesomeView()
}
