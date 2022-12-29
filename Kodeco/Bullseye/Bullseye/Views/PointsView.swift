//
//  PointsView.swift
//  Bullseye
//
//  Created by Ntogiakos, Theo on 05/09/2022.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  
  var instructionText: String
  var bigNumberText: String
  var bodyText: String
  var buttonText: String
  var points: Int
  
  var body: some View {
    VStack(spacing: 10.0) {
      InstructionText(text: instructionText)
      BigNumberText(text: bigNumberText)
      BodyText(text: bodyText)
      Button(action: {
        game.startNewRound(points: points)
        withAnimation {
          alertIsVisible = false
        }
      }) {
        ButtonText(text: buttonText)
      }
    }
    .padding()
    .background(Color("BackgroundColor"))
    .cornerRadius(12.0)
    .shadow(radius: 10, x: 5, y: 5)
    .transition(.scale)
  }
}


struct PointsViewPreview: View {
  var body: some View {
    PointsView(
      game: .constant(Game()),
      alertIsVisible: .constant(true),
      sliderValue: .constant(50.0),
      instructionText: "The Slider's Value Is",
      bigNumberText: "99",
      bodyText: "You scored 200 Points\n🎉🎉🎉",
      buttonText: "Start New Round",
      points: 150
    )
  }
}

struct PointsView_Previews: PreviewProvider {
  static var previews: some View {
    PointsViewPreview()
    PointsViewPreview()
      .previewLayout(.fixed(width: 568, height: 320))
    PointsViewPreview()
      .preferredColorScheme(.dark)
    PointsViewPreview()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
