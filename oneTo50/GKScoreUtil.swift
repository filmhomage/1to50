//
//  GKScoreUtil.swift
//  oneTo50
//
//  Created by earth on 7/7/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//


import UIKit
import GameKit

struct GKScoreUtil {
    
    static func reportScore(value: Int, leaderboardid: String) {
        
        let score: GKScore = GKScore()
        score.value = Int64(value)
        score.leaderboardIdentifier = leaderboardid
        let scoreArr:[GKScore] = [score]
        GKScore.reportScores(scoreArr, withCompletionHandler:{(error:NSError?) -> Void in
            if((error != nil)){
                print("ReportScore NG")
            }else{
                print("ReportScore OK")
            }
        })
    }
}
