//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Ntogiakos, Theo on 02/09/2022.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}


struct TopView: View {
  @Binding var game: Game
  @State private var leaderboardIsShowing = false
  var body: some View {
    HStack {
      Button(action:  {
        game.restart()
      }) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        leaderboardIsShowing = true
      }) {
        RoundedImageViewFilled(systemName: "list.dash")
      }
      .sheet(
        isPresented: $leaderboardIsShowing,
        content: {
          LeaderboardView(game: $game, leaderboardIsShowing: $leaderboardIsShowing)
        }
      )
    }
  }
}


struct NumberView: View {
  var title: String
  var text: String
  
  var body: some View {
    VStack(spacing: 5.0) {
      LabelText(text: title)
      RoundedRectTextView(text: text)
    }
  }
}


struct BottomView: View {
  @Binding var game: Game
  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.score))
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
}


struct RingsView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            RadialGradient(colors:
                            [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0.0)],
                           center: .center,
                           startRadius: 100.0,
                           endRadius: 300.0
                          )
          )
          .frame(width: size, height: size)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
    BackgroundView(game: .constant(Game()))
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
