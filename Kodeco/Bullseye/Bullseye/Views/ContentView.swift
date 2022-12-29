//
//  ContentView.swift
//  Bullseye
//
//  Created by Ntogiakos, Theo on 30/08/2022.
//

import SwiftUI

struct ContentView: View {
  
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0.0 : 100.0)
        if alertIsVisible {
          let points = game.points(sliderValue: Int(sliderValue))
          PointsView(
            game: $game,
            alertIsVisible: $alertIsVisible,
            sliderValue: $sliderValue,
            instructionText: "The Slider's Value Is",
            bigNumberText: String(Int(sliderValue)),
            bodyText: "You scored " + String(points) + " Points\n🎉🎉🎉",
            buttonText: "Start New Round",
            points: points
          )
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible,
                      sliderValue: $sliderValue,
                      game: $game)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
      }
    }
    .padding()
  }
}


struct InstructionsView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
        .padding(.bottom, 15.0)
      BigNumberText(text: String(game.target))
    }
  }
}


struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
    .transition(.scale)
  }
}


struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button(action: {
      withAnimation {
        alertIsVisible = true
      }
    }) {
      Text("Hit Me".uppercased())
        .fontWeight(.black)
        .font(.title3)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(colors:
                        [Color.white.opacity(0.3), Color.clear],
                       startPoint: .top,
                       endPoint: .bottom
        )
      }
    )
    .foregroundColor(Color.white)
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .border(Color.white)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
