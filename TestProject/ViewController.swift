//
//  ViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 5.02.2016.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menuButton: UIButton?
    var backButton: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brownColor()

        self.navigationItem.title = "MrzKart Nedir ?"
        
        menuButton = UIButton()
        menuButton?.frame = CGRect(x: 10, y: 90, width: self.view.frame.width, height: 30)
        menuButton?.setTitle("AÇ ULAN", forState: UIControlState.Normal)
        menuButton?.addTarget(slideMenuController(), action: "openLeft", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        backButton = UIButton()
        backButton?.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        backButton?.setTitle("Geri", forState: UIControlState.Normal)
        backButton?.addTarget(self, action: "goBack", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(backButton!)
        
        
        //self.view.addSubview(menuButton!)
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        var msg = "MRZ KART, kurumsal müşterilerimiz için aldıkları her hizmet karşılığında hediye puan"

       msg += " kazanabilecekleri avantajlı kart sistemidir. Mirza Travel Group’un alt markalarından sağlanan uçak bileti, vize, yurt içi-yurt dışı tatil ve konaklama hizmetlerini kapsar."
        
       msg +=  " Her bilet alımınızda kartınızın statüsüyle orantılı olarak belirlediğimiz TL-Puan tutarlarınca kurumsal MRZ kart hesabınızda hediye puan birikmesini sağlayabilirsiniz. Ayrıca beraberinde kazanacağınız puanlarınızla kartınızı üst statülere taşıyabilir, ya da mevcut statünüze sunulan hediyeler için kullanabilirsiniz."
        
       //msg += "MRZ KART başvuru talep formunuzu doldururarak sisteme dahil olabilirsiniz."

        
        self.view.translatesAutoresizingMaskIntoConstraints = true;
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds;
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        //Create textview
        let textView : UITextView = UITextView(frame : CGRect(x:      10,
            y:      (screenHeight/5),
            width:  (screenWidth-20),
            height: (screenHeight/3)));
        
        //textView.backgroundColor = UIColor( red: 0.9, green: 0.9, blue:0.9, alpha: 1.0 );
        textView.backgroundColor = UIColor.brownColor()
        textView.text = NSLocalizedString(msg, comment: "");
        textView.textColor = UIColor.whiteColor()
        //textView.borderStyle:  border's are not supported by the UITextView
        
        self.view.addSubview(textView);
        
        
        
    }

    func goBack()
    {
     var home = HomeViewController()
        self.presentViewController(home, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

