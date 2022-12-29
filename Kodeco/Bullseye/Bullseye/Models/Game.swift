//
//  Game.swift
//  Bullseye
//
//  Created by Ntogiakos, Theo on 31/08/2022.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 1040, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 300, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 600, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 300, date: Date()))
    }
  }
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(sliderValue - target)
    var bonus = 0
    
    switch difference {
    case 0:
      bonus = 100
    case 1:
      bonus = 50
    default:
      bonus = 0
    }
    return 100 - difference + bonus
  }
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...100)
    addToLeaderboard(points: points)
  }
  
  mutating func restart() {
    target = Int.random(in: 1...100)
    score = 0
    round = 1
  }
  
  mutating func addToLeaderboard(points: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
    leaderboardEntries.sort {$0.score > $1.score}
  }
}
