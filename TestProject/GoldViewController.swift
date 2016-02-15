//
//  GoldViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 08/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit
import Material

class GoldViewController: UIViewController {

    var containerView : UIView!
    let statuView : CardView = CardView()
    
    var titleArray:[String] = ["Statü Puan Barajı","Statü Geciş Bedeli","Statü Geçiş Hediyesi","Uçak Biletlerinize Hediye","Statü Yenileme Koşulları","Vizenize Hediye", "Statü Puanı Satın Alma Hakkı", "Otel ve Tatil Paketlerinize Hediye", "Taksit / Komisyon" ,"Kartın Geçerlilik Süresi","Puan Geçerlilik Süresi", "VIP Transfer Hizmeti"]
    
    var contentArray:[String] = ["30.000 Puan", "- 30.000 Puan","Ipad mini","İç Hat; 3 TL, Dış Hat; 7 TL","İlk 6 ayda 20.000 ya da 1 yılda 40.000 puan","10 TL"
        ,"Maksimum 10.000 Puan","Yurt İçi; 10 TL - Yurt Dışı; 15 TL","2 Taksite Vade Farksız","1 Yıl","2 Yıl","-"]
    

    var tblView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.frame = CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height)
        
        tblView.dataSource = self
        
        tblView.delegate = self
        tblView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tblView)
        self.view.backgroundColor = UIColor.brownColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

    private func prepareView() {
        //self.view.backgroundColor = MaterialColor.deepOrange
    }
}



extension GoldViewController:UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menu:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        menu.clearsContextBeforeDrawing = true
        let statuTitle: UILabel = UILabel()
        statuTitle.text = titleArray[indexPath.row]
        statuTitle.textColor = MaterialColor.blue.darken1
        statuTitle.font = RobotoFont.mediumWithSize(15)
        statuView.titleLabel = statuTitle
        
        
        let statuLabel: UILabel = UILabel()
        statuLabel.text = contentArray[indexPath.row]
        statuLabel.numberOfLines = 0
        statuView.detailLabel = statuLabel

        menu.contentView.addSubview(statuView)
        statuView.translatesAutoresizingMaskIntoConstraints = false
        
        MaterialLayout.alignFromTop(menu.contentView, child: statuView, top: 100)
        MaterialLayout.alignToParentHorizontally(menu.contentView, child: statuView, left: 20, right: 20)
    

        return menu
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        /* print(menuItems[indexPath.row] +  "(menuItems[indexPath])")
        
        var vc = UIViewController()
        let selectedIndex = "\(indexPath.row)"
        switch selectedIndex {
            
        case "0":
            vc = ViewController()
        case "1":
            vc = RulesViewController()
        case "2":
            vc = GiftViewController()
        case "3":
            self.presentViewController(CardViewController(), animated: true, completion: nil)
        default:
            self.presentViewController(CardViewController(), animated: true, completion: nil)
        }
        
        let nc = UINavigationController(rootViewController: vc)
        self.slideMenuController()?.changeMainViewController(nc, close: true)
        */
        print("seçilen \(indexPath.row)")
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    
    
}

