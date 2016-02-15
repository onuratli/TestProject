//
//  ExSlideMenuController.swift
//  TestProject
//
//  Created by Onur Atlı on 11/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit


class ExSlideMenuController : SlideMenuController {
    
    override func isTagetViewController() -> Bool {
        if let vc = UIApplication.topViewController() {
            if vc is MainViewController ||
                vc is SwiftViewController ||
                vc is JavaViewController ||
                vc is GoViewController {
                    return true
            }
        }
        return false
    }
}

