//
//  GoldViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 17/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit
import Material
class GoldViewController: UIViewController {
    
    var titleArray:[String] = ["Statü Puan Barajı","Statü Geciş Bedeli","Statü Geçiş Hediyesi","Uçak Biletlerinize Hediye","Statü Yenileme Koşulları","Vizenize Hediye", "Statü Puanı Satın Alma Hakkı", "Otel ve Tatil Paketlerinize Hediye", "Taksit / Komisyon" ,"Kartın Geçerlilik Süresi","Puan Geçerlilik Süresi", "VIP Transfer Hizmeti"]
    
    var contentArray : [String] = ["30.000 Puan", "- 30.000 Puan","Ipad mini","İç Hat; 3 TL, Dış Hat; 7 TL","İlk 6 ayda 20.000 ya da 1 yılda 40.000 puan","10 TL"
        ,"Maksimum 10.000 Puan","Yurt İçi; 10 TL - Yurt Dışı; 15 TL","2 Taksite Vade Farksız","1 Yıl","2 Yıl","-"]
    var tblView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.title = "Gold Card"
        
        tblView.dataSource = self
        tblView.delegate = self
        tblView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.tblView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(tblView)
        
        self.tblView.rowHeight = UITableViewAutomaticDimension
        
        
        tblView.backgroundColor = UIColor.clearColor()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
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



extension GoldViewController:UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        let statuView : CardView = CardView()
        
        
        let statuTitle: UILabel = UILabel()
        statuTitle.text = titleArray[indexPath.row]
        statuTitle.textColor = MaterialColor.blue.darken1
        statuTitle.font = RobotoFont.mediumWithSize(15)
        statuView.titleLabel = statuTitle
        
        
        let statuLabel: UILabel = UILabel()
        statuLabel.text = contentArray[indexPath.row]
        statuLabel.numberOfLines = 0
        statuView.detailView = statuLabel
        
        cell.contentView.addSubview(statuView)
        statuView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: statuView, top: 10)
        MaterialLayout.alignToParentHorizontally(view, child: statuView, left: 20, right: 20)
        statuView.divider  = false
        statuView.layer.cornerRadius = 5
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.backgroundColor = UIColor.clearColor()
        
        
        print("Card olcusu:" , statuView.height)
        
        return cell
    }
    
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //
    //        print("seçilen \(indexPath.row)")
    //    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 120
        }
        return 100
    }
    
}

