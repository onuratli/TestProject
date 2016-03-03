//
//  LeftViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 5.02.2016.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    var menutableView: UITableView = UITableView()
    var menuItems:[String] = ["MrzKart Nedir ?" , "Kurallar", "Hediyeler","Başvuru" , "Katılım Koşulları" ,"İletişim"]
//    var iconArray: [UIImage] = [UIImage(named: "home")!, UIImage(named: "mail")!,UIImage(named: "phone")!, UIImage(named: "printer")!, UIImage(named: "printer")!, UIImage(named: "printer")!, UIImage(named: "printer")!, UIImage(named: "printer")!]
    var iconArray: [UIImage] = [UIImage(named: "user")!
        , UIImage(named: "kural")!
        ,UIImage(named: "gift")!
        , UIImage(named: "pen")!
        , UIImage(named: "wallet")!, UIImage(named: "mail")!]
    var homeViewController = HomeViewController()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.whiteColor()
        menutableView.frame = CGRect(x: 0, y: 50, width: self.view.frame.width - 110, height: self.view.frame.height)
        
        menutableView.dataSource = self
        
        menutableView.delegate = self
        menutableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menutableView.backgroundColor = UIColor.clearColor()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "menuBg")!)
        
        self.view.addSubview(menutableView)
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "menuBg")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()

        
        
        let newSwiftColor = UIColor(red: 56, green: 61, blue: 67)
        
        
        
        self.view.backgroundColor = newSwiftColor
        
        // Do any additional setup after loading the view.
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


extension LeftViewController:UITableViewDataSource, UITableViewDelegate
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
        menu.textLabel?.color(UIColor.whiteColor())
        
        menu.imageView?.image = imageWithImage(iconArray[indexPath.row]
, scaledToSize: CGSize(width: 25, height: 25))
        return menu
    }
    
    func imageWithImage(image:UIImage,scaledToSize newSize:CGSize)->UIImage{
        
        UIGraphicsBeginImageContext( newSize )
        image.drawInRect(CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        print(menuItems[indexPath.row] +  "(menuItems[indexPath])")

        var vc = UIViewController()
        let selectedIndex = "\(indexPath.row)"
        switch selectedIndex {
        
        case "0":
            vc = HomeViewController()
        case "1":
            vc = RulesViewController()
        case "2":
            vc = GiftViewController()
        case "3":
            vc = HomeViewController()
            case "4":
            vc = ConditionsViewController()
        case "5":
            vc = ContactViewController()
        default:
            self.presentViewController(gridViewController(), animated: true, completion: nil)
        }
        
        let nc = UINavigationController(rootViewController: vc)
        self.slideMenuController()?.changeMainViewController(nc, close: true)
        
        print("seçilen \(indexPath.row)")
        
        }
    
}

extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int)
    {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 0.9)
    }
}
