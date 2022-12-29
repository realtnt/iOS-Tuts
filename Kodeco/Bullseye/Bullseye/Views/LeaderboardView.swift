//
//  RowView.swift
//  Bullseye
//
//  Created by Ntogiakos, Theo on 06/09/2022.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var game: Game
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
      LeaderboardBackgroundView(leaderboardIsShowing: $leaderboardIsShowing)
      VStack(spacing: 10) {
        HeaderView()
        LabelView()
        ScrollView {
          VStack {
            ForEach(game.leaderboardEntries.indices) { i in
              let leaderboardEntry = game.leaderboardEntries[i]
              RowView(index: i + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
  }
}


struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    Spacer()
  }
}


struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    if verticalSizeClass == .regular && horizontalSizeClass == .compact {
      HStack {
        BigBoldText(text: "Leaderboard")
          .padding()
        Spacer()
      }
    } else {
      BigBoldText(text: "Leaderboard")
        .padding()
    }
  }
}


struct LeaderboardBackgroundView: View {
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View {
    VStack{
      HStack {
        Spacer()
        Button(action: {
          leaderboardIsShowing = false
        }) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.bottom)
            .padding(.trailing)
        }
      }
      Spacer()
    }
  }
}


struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}


struct LeaderboardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(true)
  static var previews: some View {
    Group {
      LeaderboardView(game: .constant(Game()), leaderboardIsShowing: leaderboardIsShowing)
      LeaderboardView(game: .constant(Game()), leaderboardIsShowing: leaderboardIsShowing)
    }
    LeaderboardView(game: .constant(Game()), leaderboardIsShowing: leaderboardIsShowing)
      .previewLayout(.fixed(width: 568, height: 320))
    LeaderboardView(game: .constant(Game()), leaderboardIsShowing: leaderboardIsShowing)
      .preferredColorScheme(.dark)
    LeaderboardView(game: .constant(Game()), leaderboardIsShowing: leaderboardIsShowing)
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
