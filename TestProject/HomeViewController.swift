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
        let menuImage = UIImage(named: "burgericon2")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: UIBarButtonItemStyle.Done, target: slideMenuController(), action: "openLeft")

        self.navigationItem.title = "Mrz Kart Nedir ?"
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        //self.view.backgroundColor = UIColor.whiteColor()
        textField()
        
         let navigationBgColor = UIColor(red: 59, green: 175, blue: 218)
        navigationController!.navigationBar.barTintColor = navigationBgColor

        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    
    
    
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
    
    func textField() {
        let textView = UITextView(frame: CGRectMake(10, 80, self.view.frame.width-20, self.view.frame.height-200))
        textView.textAlignment = NSTextAlignment.Center
        textView.textColor = UIColor.blackColor()
        textView.backgroundColor = UIColor.clearColor()
        textView.text = read()
        textView.font = UIFont(name: "KannadaSangamMN", size: 15)
        
        self.view.addSubview(textView)
    }
    
    
    func read() -> String
    {
        let myFileURL = NSBundle.mainBundle().URLForResource("mrzKartNedir", withExtension: "txt")!
        let myText = try! String(contentsOfURL: myFileURL, encoding: NSUTF8StringEncoding)
        return myText
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


