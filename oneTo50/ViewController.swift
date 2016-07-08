//
//  ViewController.swift
//  oneTo50
//
//  Created by earth on 7/1/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    let kNumberButtonTag = 8000
    
    var timer : NSTimer?
    var count : Float = 0
    var numbers25 = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onUpdate(timer : NSTimer){
        self.count += 0.1
        let str = "".stringByAppendingFormat("%.1f",self.count)
        timeLabel.text = str
    }
    
    func initTimer() {
        self.count = 0
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.onUpdate(_:)), userInfo: nil, repeats: true)
    }

    @IBAction func didTapStartButton(sender: UIButton) {
        
        if sender.titleLabel?.text == "start" {
            sender.setTitle("pause", forState: .Normal)
            self.initTimer()
        } else {
            sender.setTitle("start", forState: .Normal)
            if let timer = self.timer {
                timer.invalidate()
            }
        }
    }
    
    @IBAction func didTapScoreButton(sender: AnyObject) {
    }
    
    
    @IBAction func didTapNumberButton(sender: UIButton) {
        
        if self.starButton.titleLabel?.text == "start" {
            self.didTapStartButton(self.starButton)
        }
    }
    
    func confirmScore() {

        let localPlayer = GKLocalPlayer()
        let navigationController = self.view?.window?.rootViewController as! UINavigationController
        
        if let vc = navigationController.visibleViewController as? ViewController {
            
            localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler({ (leaderboardIdentifier : String?, error : NSError?) -> Void in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    let gameCenterController:GKGameCenterViewController = GKGameCenterViewController()
//                    gameCenterController.gameCenterDelegate = vc
                    gameCenterController.viewState = GKGameCenterViewControllerState.Leaderboards
                    gameCenterController.leaderboardIdentifier = "score"
                    vc.presentViewController(gameCenterController, animated: true, completion: nil)
                }
            })
        }
    }
}

