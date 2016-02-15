//
//  HomeViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 5.02.2016.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var menuButton: UIButton?
//    var testButton: UIButton?

    var getViewButton: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        let menuImage = UIImage(named: "hamburger")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: UIBarButtonItemStyle.Plain, target: slideMenuController(), action: "openLeft")
        
        //self.navigationItem.title = "HOme Title"
        menuButton = UIButton()
        menuButton?.frame = CGRect(x: 10, y: 70, width: self.view.frame.width, height: 30)
        menuButton?.setTitle("Menüyü aç", forState: UIControlState.Normal)

        getViewButton = UIButton()
        getViewButton?.frame = CGRect(x: 10, y: 200, width: self.view.frame.width, height: 30)
        getViewButton?.setTitle("İkinc", forState: UIControlState.Normal)
        getViewButton?.addTarget(self, action: "getAnotherView", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(getViewButton!)
        
        
        // buradaki openLeft indirdiğimiz slideMenuController'ın bir fonksiyonu, bu dökümanlarında varmış. bu standart bir kullanım bu eklenti/kütüphane için. mantık olarak openLeft metodunu çalıştırıyor.
        
        menuButton?.addTarget(slideMenuController(), action: "openLeft", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(menuButton!)
        
        
        
        
//        var height:CGFloat = 100
//
//        for var index = 0; index < 50; ++index {
//        
//            testButton = UIButton()
//            testButton?.frame = CGRect(x: 10, y: height, width: self.view.frame.width, height: 30)
//            testButton?.setTitle("selam aç", forState: UIControlState.Normal)
//            self.view.addSubview(testButton!)
//            
//            height += 200
//
//        }
//        
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func getAnotherView() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //self.presentViewController(vc, animated: true, completion: nil)
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
