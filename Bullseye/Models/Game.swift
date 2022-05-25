//
//  Game.swift
//  Bullseye
//
//  Created by Caroline Chan on 12/05/22.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game{
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries : [LeaderboardEntry] = []
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(sliderValue - target)
        let bonus : Int
        if difference == 0 {
            bonus = 100
        }else if difference <= 2 {
            bonus = 50
        }else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int){
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(point: points)
    }
    
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(point: Int){
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort {$0.score > $1.score}
    }
}