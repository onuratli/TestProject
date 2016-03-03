//
//  ClassicViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 08/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit

class ClassicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        menuButton = UIButton()
//        menuButton?.frame = CGRect(x: 10, y: 70, width: self.view.frame.width, height: 30)
//        menuButton?.setTitle("CLASSIC Kart", forState: UIControlState.Normal)
//        self.view.addSubview(menuButton!)
        self.view.backgroundColor = UIColor.brownColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
