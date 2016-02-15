//
//  RulesViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 08/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    var menuButton: UIButton?
    var RulesTableview: UITableView = UITableView()
    var cardTypes:[String] = ["CLASSIC" , "GOLD" , "BUSINESS" , "PLATINUM"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuImage = UIImage(named: "hamburger")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: UIBarButtonItemStyle.Plain, target: slideMenuController(), action: "openLeft")
        
        menuButton = UIButton()
        menuButton?.frame = CGRect(x: 10, y: 10, width: self.view.frame.width, height: 30)
        menuButton?.setTitle("Kurallar", forState: UIControlState.Normal)
        self.view.addSubview(menuButton!)
        self.view.backgroundColor = UIColor.brownColor()
        self.navigationItem.title = "Kurallar"
        RulesTableview.frame = CGRect(x: 40, y: 50, width: self.view.frame.width, height: self.view.frame.height)
        
        
        
        //işte boyle olum demek ıstedıgım buydu vazgecmemek ! vallaha bravo tebrık ederım kardesım
        
        
        RulesTableview.dataSource = self
        
        RulesTableview.delegate = self
        RulesTableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        RulesTableview.backgroundColor = UIColor.clearColor()
        
        RulesTableview.tableFooterView = UIView(frame: CGRectZero)
        RulesTableview.separatorStyle = UITableViewCellSeparatorStyle.None
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "menuBg")!)
        self.view.addSubview(RulesTableview)
        

        //ICON
        
        let icon:UIImage = UIImage(named: "icon-advantage.png")!
        let iconView = UIImageView(image: icon)
        
        iconView.frame = CGRect(x: 40, y: 0, width: 40, height: 40)
        self.view.addSubview(iconView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigationlllllll

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension RulesViewController:UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardTypes.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menu:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        menu.textLabel?.text = menuItems[indexPath.row]
        menu.backgroundColor = UIColor.clearColor()
        menu.textLabel?.textColor = UIColor.whiteColor()
        
        
        
        
        
        // kart tiplerine göre ımage dosyaları yuklenıyor
        
        let selectedIndex = "\(indexPath.row)"
        switch selectedIndex {
            
        case "0":
            
            let image : UIImage = UIImage(named: "classic-card")!
            print("The loaded image: \(image)")
            menu.imageView!.image = image
        
        case "1":
        
            let image : UIImage = UIImage(named: "gold-card")!
            print("The loaded image: \(image)")
            menu.imageView!.image = image
        
        case "2":
            
            let image : UIImage = UIImage(named: "business-card")!
            print("The loaded image: \(image)")
            menu.imageView!.image = image
        
        case "3":
        
            let image : UIImage = UIImage(named: "platinum-card")!
            print("The loaded image: \(image)")
            menu.imageView!.image = image
        
        default:
            let image : UIImage = UIImage(named: "classic-card")!
            print("The loaded image: \(image)")
            menu.imageView!.image = image        }

        
        
        return menu
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var selectedCellIndexPath: NSIndexPath?
        let selectedCellHeight: CGFloat = 188.0
        let unselectedCellHeight: CGFloat = 94.0
    if selectedCellIndexPath == indexPath {
    return selectedCellHeight
    
        }
    
        return unselectedCellHeight
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(menuItems[indexPath.row] +  "(menuItems[indexPath])")
        
        
        let selectedIndex = "\(indexPath.row)"
        switch selectedIndex {
            
        case "0":
            self.navigationController?.pushViewController(CardViewController(), animated: true)
        case "1":
            self.presentViewController(GoldViewController(), animated: true, completion: nil)
        case "2":
            self.presentViewController(BusinessViewController(), animated: true, completion: nil)
        case "3":
            self.presentViewController(PlatinumViewController(), animated: true, completion: nil)
        default:
            self.presentViewController(ClassicViewController(), animated: true, completion: nil)
        }
        
        print("seçilen \(indexPath.row)")
        
    }
    
}



