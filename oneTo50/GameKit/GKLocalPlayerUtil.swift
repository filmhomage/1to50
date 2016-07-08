//
//  GKLocalPlayerUtil.swift
//  oneTo50
//
//  Created by earth on 7/7/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit
import GameKit

struct GKLocalPlayerUtil {
    
    static var localPlayer:GKLocalPlayer = GKLocalPlayer();
    
    static func login(target: UIViewController){
        
        self.localPlayer = GKLocalPlayer.localPlayer()
        self.localPlayer.authenticateHandler = {(viewController, error) -> Void in

            print(error)

            if ((viewController) != nil) {
                print("LoginCheck: Failed - LoginPageOpen")
                target.presentViewController(viewController!, animated: true, completion: nil);
            }else{
                print("LoginCheck: Success")
                if (error == nil){
                    print("LoginAuthentication: Success")
                }else{
                    print("LoginAuthentication: Failed")
                }
            }
        }
    }
}