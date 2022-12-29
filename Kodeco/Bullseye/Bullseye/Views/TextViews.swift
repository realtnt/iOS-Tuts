//
//  TextViews.swift
//  Bullseye
//
//  Created by Ntogiakos, Theo on 01/09/2022.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .fontWeight(.black)
      .font(.largeTitle)
      .kerning(-1.0)
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .foregroundColor(Color("TextColor"))
      .font(.caption)
      .kerning(1.5)
      .frame(width: 35.0)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .font(.caption)
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
  }}

struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .font(.subheadline)
      .lineSpacing(19.0)
      .padding(.bottom, 13.0)
  }}


struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color(.white))
      .frame(maxWidth: .infinity)
      .padding()
      .background(
        Color("AccentColor")
      )
      .cornerRadius(12.0)
  }}

struct ScoreText: View {
  var score: Int
  
  var body: some View {
    Text(String(score))
      .foregroundColor(Color("TextColor"))
      .bold()
      .font(.title3)
      .kerning(-0.2)
  }
}

struct DateText: View {
  var date: Date
  
  var body: some View {
    Text(date, style: .time)
      .foregroundColor(Color("TextColor"))
      .bold()
      .font(.title3)
      .kerning(-0.2)
  }
}

struct BigBoldText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor((Color("TextColor")))
      .fontWeight(.black)
      .font(.title)
      .kerning(2.0)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "91")
      SliderLabelText(text: "55")
      LabelText(text: "9")
      BodyText(text: "You scored 200 Points\n🎉🎉🎉")
      ButtonText(text: "Start New Round")
      ScoreText(score: 999)
      DateText(date: Date())
      BigBoldText(text: "Leaderboard")
      LabelText(text: "Score")
    }
  }
}
