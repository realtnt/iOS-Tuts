//
//  SFSymbolsView.swift
//  YouAreAwesome
//
//  Created by Theo Ntogiakos on 11/11/2023.
//

import SwiftUI

class SFSymbolsViewModel: ObservableObject {
    @Published var symbol: String
    @Published var color1: Color
    @Published var color2: Color
    @Published var color3: Color
    @Published var backgroundColor: Color = .green
    @Published var message: String
    
    private let messages = [
        "Hello!",
        "The Weather",
        "The Volume",
        "Other message!"
    ]
    
    private let symbols = [
        "cloud.sun.fill",
        "cloud.sun.rain.fill",
        "cloud.sun.bolt.fill",
        "thermometer.sun.fill",
        "cloud.rainbow.half",
        "cloud.bolt.rain.fill",
        "aqi.high"
    ]
    
    private let colors: [Color] = [.blue, .orange, .black, .green, .teal, .red, .yellow ]
    
    init() {
        self.symbol = symbols.first!
        self.color1 = colors.first!
        self.color2 = colors.first!
        self.color3 = colors.last!
        self.message = messages.first!
    }
    
    func setRandomColor() {
        color1 = colors[Int.random(in: 0..<colors.count)]
        color2 = colors[Int.random(in: 0..<colors.count)]
        color3 = colors[Int.random(in: 0..<colors.count)]
    }
    
    func setRandomSymbol() {
        symbol = symbols[Int.random(in: 0..<symbols.count)]
    }
    
    func setRandomMessage() {
        if message == messages[0] {
            message = messages[1]
        } else if message == messages[1] {
            message = messages[3]
        } else {
            message = messages[Int.random(in: 0..<messages.count)]
        }
    }
}

struct SFSymbolsView: View {
    @StateObject var vm = SFSymbolsViewModel()
    @State private var sliderValue = 0.0
    
    var body: some View {
        VStack {
            Spacer()

            Image(systemName: vm.symbol)
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(vm.color1, vm.color2, vm.color3)
                .padding()
                .background(.yellow)
                .cornerRadius(15)
                .shadow(radius: 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(.orange)
                )
                .padding()

            Text(vm.message)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(vm.color1)
                .frame(height: 150)

            Spacer()

            Image(systemName: "speaker.wave.3", variableValue: sliderValue)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .padding(30)
                .background(.brown)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

            Slider(value: $sliderValue)
                .padding()

            Spacer()

            HStack {
                Button("Symbol") {
                    vm.setRandomSymbol()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                
                Button("Message") {
                    vm.setRandomMessage()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                
                Button("Color") {
                    vm.setRandomColor()
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
        }
        .background(Color(hue: 0.498, saturation: 0.175, brightness: 0.709))
    }
}

#Preview {
    SFSymbolsView()
}
