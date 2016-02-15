//
//  NotificationViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 08/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit
var noticeButton = UIButton?()
var menutableView: UITableView = UITableView()
var menuItems:[String] = ["CLASSIC" , "GOLD" , "BUSINESS" , "PLATINUM"]
class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        noticeButton = UIButton()
        noticeButton?.frame = CGRect(x: 10, y: 10, width: self.view.frame.width, height: 30)
        noticeButton?.setTitle("Bildirimler !", forState: UIControlState.Normal)
        self.view.addSubview(noticeButton!)
        self.view.backgroundColor = UIColor.brownColor()

    
        menutableView.frame = CGRect(x: 0, y: 50, width: self.view.frame.width - 110, height: self.view.frame.height)
        
        menutableView.dataSource = self
        
        menutableView.delegate = self
        menutableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menutableView.backgroundColor = UIColor.clearColor()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "menuBg")!)
        self.view.addSubview(menutableView)
        
        

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



extension NotificationViewController:UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menu:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        menu.textLabel?.text = menuItems[indexPath.row]
        menu.backgroundColor = UIColor.clearColor()
        
        
        
        var image : UIImage = UIImage(named: "classic-card")!
        print("The loaded image: \(image)")
        menu.imageView!.image = image
        
        return menu
}

}
