//
//  gridViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 19/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit
import Material
class gridViewController: UIViewController {
    
    var iconArray: [UIImage] = [UIImage(named: "ipad")!, UIImage(named: "macbook")!,UIImage(named: "iphone")!]

    var titleArray:[String] = ["IPAD" , "MACBOOK", "IPHONE"]
    
//    var contentArray:[String] = ["Gold kart hediyemiz olan Ipad ı kazanmak için hesabınızda biriken puanların en az 30.000 olması gerekmektedir." , "Platinium kart hediyemiz olan Macbook Air ı kazanmak için hesabınızda biriken puanların en az 90.000 olması gerekmektedir." , "Business kart hediyemiz olan İphone u kazanmak için hesabınızda biriken puanların en az 60.000 olması gerekmektedir."]
    var tblView: UITableView = UITableView()
    var contentArray:[String] = ["Gold Kart'a geçen müşterilerimize hediyemiz Ipad" , "Platinium Kart'a geçen müşterilerimize hediyemiz Macbook Air" , "Business Kart'a geçen müşterilerimize hediyemiz  Iphone"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tblView.dataSource = self
        tblView.delegate = self
        tblView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblView.frame = CGRect(x: 0, y: -90, width: self.view.frame.width, height: self.view.frame.height+120)
        self.tblView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(tblView)
        let menuImage = UIImage(named: "hamburger")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: UIBarButtonItemStyle.Plain, target: slideMenuController(), action: "openLeft")
        self.navigationItem.title = "Hediyeler"

        self.tblView.rowHeight = UITableViewAutomaticDimension
        
        
        tblView.backgroundColor = UIColor.clearColor()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "menuBg")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        

}
    
    
    /// General preparation statements are placed here.
    private func prepareView() {
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "menuBg")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    /// Prepares the Horizontal GridView example.
    private func prepareHorizontalGridViewExample() {
        var image: UIImage? = UIImage(named: "ic_flash_auto_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.blueGrey.darken4
        btn1.tintColor = MaterialColor.blueGrey.darken4
        btn1.backgroundColor = MaterialColor.grey.lighten3
        btn1.setImage(image, forState: .Normal)
        btn1.setImage(image, forState: .Highlighted)
        view.addSubview(btn1)
        
        image = UIImage(named: "ic_flash_off_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let btn2: FlatButton = FlatButton()
        btn2.pulseColor = MaterialColor.blueGrey.darken4
        btn2.tintColor = MaterialColor.blueGrey.darken4
        btn2.backgroundColor = MaterialColor.grey.lighten3
        btn2.setImage(image, forState: .Normal)
        btn2.setImage(image, forState: .Highlighted)
        view.addSubview(btn2)
        
        image = UIImage(named: "ic_flash_on_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let btn3: FlatButton = FlatButton()
        btn3.pulseColor = MaterialColor.blueGrey.darken4
        btn3.tintColor = MaterialColor.blueGrey.darken4
        btn3.backgroundColor = MaterialColor.grey.lighten3
        btn3.setImage(image, forState: .Normal)
        btn3.setImage(image, forState: .Highlighted)
        view.addSubview(btn3)
        
        btn1.grid.columns = 3
        
        btn2.grid.columns = 3
        
        btn3.grid.columns = 3
        
        view.grid.columns = 9
        view.grid.spacing = 16
        view.grid.contentInset.left = 16
        view.grid.contentInset.right = 16
        view.grid.contentInset.top = 100
        view.grid.contentInset.bottom = 100
        view.grid.views = [btn1, btn2, btn3]
        
        for v in view.grid.views! {
            print(v.frame)
        }
    }
    
    /// Prepares the Vertical GridView example.
    private func prepareVerticalGridViewExample() {
        var image: UIImage? = UIImage(named: "ic_flash_auto_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.blueGrey.darken4
        btn1.tintColor = MaterialColor.blueGrey.darken4
        btn1.backgroundColor = MaterialColor.grey.lighten3
        btn1.setImage(image, forState: .Normal)
        btn1.setImage(image, forState: .Highlighted)
        view.addSubview(btn1)
        
        image = UIImage(named: "ic_flash_off_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let btn2: FlatButton = FlatButton()
        btn2.pulseColor = MaterialColor.blueGrey.darken4
        btn2.tintColor = MaterialColor.blueGrey.darken4
        btn2.backgroundColor = MaterialColor.grey.lighten3
        btn2.setImage(image, forState: .Normal)
        btn2.setImage(image, forState: .Highlighted)
        view.addSubview(btn2)
        
        image = UIImage(named: "ic_flash_on_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let btn3: FlatButton = FlatButton()
        btn3.pulseColor = MaterialColor.blueGrey.darken4
        btn3.tintColor = MaterialColor.blueGrey.darken4
        btn3.backgroundColor = MaterialColor.grey.lighten3
        btn3.setImage(image, forState: .Normal)
        btn3.setImage(image, forState: .Highlighted)
        view.addSubview(btn3)
        
        btn1.grid.rows = 3
        
        btn2.grid.rows = 3
        
        btn3.grid.rows = 3
        
        view.grid.rows = 9
        view.grid.spacing = 16
        view.grid.contentInset.left = 16
        view.grid.contentInset.right = 16
        view.grid.contentInset.top = 100
        view.grid.contentInset.bottom = 100
        view.grid.axis.direction = .Vertical
        view.grid.views = [btn1, btn2, btn3]
        
        for v in view.grid.views! {
            print(v.frame)
        }
    }
    
    private func prepareGridDirectionNoneExample() {
        let labelA: UILabel = UILabel()
        labelA.text = "A"
        labelA.textAlignment = .Center
        labelA.backgroundColor = MaterialColor.yellow.lighten3
        view.addSubview(labelA)
        
        let labelB: UILabel = UILabel()
        labelB.text = "B"
        labelB.textAlignment = .Center
        labelB.backgroundColor = MaterialColor.green.lighten3
        view.addSubview(labelB)
        
        labelA.grid.rows = 6
        labelA.grid.columns = 6
        
        labelB.grid.rows = 6
        labelB.grid.columns = 6
        labelB.grid.offset.rows = 6
        labelB.grid.offset.columns = 6
        
        view.grid.spacing = 16
        view.grid.axis.direction = .None
        view.grid.contentInsetPreset = .Square6
        view.grid.views = [labelA, labelB]
    }
    
    /// Prepares the small card example.
    private func prepareSmallCardViewExample() {
        let cardView: MaterialPulseView = MaterialPulseView(frame: CGRectMake(16, 100, view.bounds.width - 32, 152))
        cardView.pulseColor = MaterialColor.blueGrey.base
        cardView.depth = .Depth1
        view.addSubview(cardView)
        
        var image: UIImage? = UIImage(named: "ipad")
        let imageView: MaterialView = MaterialView()
        imageView.image = image
        imageView.contentsGravity = .ResizeAspectFill
        cardView.addSubview(imageView)
        
        let contentView: MaterialView = MaterialView()
        contentView.backgroundColor = MaterialColor.clear
        cardView.addSubview(contentView)
        
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "IPAD / GOLD"
        titleLabel.textColor = MaterialColor.blue.darken1
        titleLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(titleLabel)
        
        image = UIImage(named: "ic_more_vert_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let moreButton: FlatButton = FlatButton()
//        moreButton.contentInsetPreset = .None
        moreButton.pulseColor = MaterialColor.blueGrey.darken4
        moreButton.tintColor = MaterialColor.blueGrey.darken4
        moreButton.setImage(image, forState: .Normal)
        moreButton.setImage(image, forState: .Highlighted)
        contentView.addSubview(moreButton)
        
        let detailLabel: UILabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = .ByTruncatingTail
        detailLabel.font = RobotoFont.regularWithSize(12)
        detailLabel.text = "Gerekli Puan  : 30.000"
        detailLabel.textColor = MaterialColor.blueGrey.darken4
        detailLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(detailLabel)
        
        let alarmLabel: UILabel = UILabel()
        alarmLabel.font = RobotoFont.regularWithSize(12)
        alarmLabel.text = "34 min"
        alarmLabel.textColor = MaterialColor.blueGrey.darken4
        alarmLabel.backgroundColor = MaterialColor.clear
        //contentView.addSubview(alarmLabel)
        
        image = UIImage(named: "ic_alarm_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let alarmButton: FlatButton = FlatButton()
        //alarmButton.contentInsetPreset = .None
        alarmButton.pulseColor = MaterialColor.blueGrey.darken4
        alarmButton.tintColor = MaterialColor.red.base
        alarmButton.setImage(image, forState: .Normal)
        alarmButton.setImage(image, forState: .Highlighted)
        //contentView.addSubview(alarmButton)
        
        imageView.grid.columns = 4
        
        contentView.grid.columns = 8
        
        cardView.grid.views = [
            imageView,
            contentView
        ]
        
        titleLabel.grid.rows = 3
        titleLabel.grid.columns = 9
        
        moreButton.grid.rows = 3
        moreButton.grid.columns = 2
        moreButton.grid.offset.columns = 10
        
        detailLabel.grid.rows = 4
        detailLabel.grid.offset.rows = 4
        
        alarmLabel.grid.rows = 3
        alarmLabel.grid.offset.rows = 9
        alarmLabel.grid.columns = 9
        
        alarmButton.grid.rows = 3
        alarmButton.grid.offset.rows = 9
        alarmButton.grid.columns = 2
        alarmButton.grid.offset.columns = 10
        
        contentView.grid.spacing = 8
        contentView.grid.axis.inherited = false
        contentView.grid.axis.direction = .None
        contentView.grid.contentInsetPreset = .Square3
        contentView.grid.views = [
            titleLabel,
            moreButton,
            detailLabel,
            alarmLabel,
            alarmButton
        ]
    }
    
    /// Prepares the medium card example.
    private func prepareMediumCardViewExample() {
        let cardView: MaterialPulseView = MaterialPulseView(frame: CGRectMake(16, 100, view.bounds.width - 32, 240))
        cardView.pulseColor = MaterialColor.blueGrey.base
        cardView.depth = .Depth1
        view.addSubview(cardView)
        
        var image: UIImage? = UIImage(named: "CosmicMindInverted")
        let imageView: MaterialView = MaterialView()
        imageView.image = image
        imageView.contentsGravity = .ResizeAspectFill
        cardView.addSubview(imageView)
        
        let contentView: MaterialView = MaterialView()
        contentView.backgroundColor = MaterialColor.clear
        cardView.addSubview(contentView)
        
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Material"
        titleLabel.textColor = MaterialColor.blueGrey.darken4
        titleLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(titleLabel)
        
        image = UIImage(named: "ic_more_vert_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let moreButton: FlatButton = FlatButton()
        //moreButton.contentInsetPreset = .None
        moreButton.pulseColor = MaterialColor.blueGrey.darken4
        moreButton.tintColor = MaterialColor.blueGrey.darken4
        moreButton.setImage(image, forState: .Normal)
        moreButton.setImage(image, forState: .Highlighted)
        contentView.addSubview(moreButton)
        
        let detailLabel: UILabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = .ByTruncatingTail
        detailLabel.font = RobotoFont.regularWithSize(12)
        detailLabel.text = "Express your creativity with Material, an animation and graphics framework for Google's Material Design and Apple's Flat UI in Swift."
        detailLabel.textColor = MaterialColor.blueGrey.darken4
        detailLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(detailLabel)
        
        let alarmLabel: UILabel = UILabel()
        alarmLabel.font = RobotoFont.regularWithSize(12)
        alarmLabel.text = "34 min"
        alarmLabel.textColor = MaterialColor.blueGrey.darken4
        alarmLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(alarmLabel)
        
        image = UIImage(named: "ic_alarm_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let alarmButton: FlatButton = FlatButton()
        //alarmButton.contentInsetPreset = .None
        alarmButton.pulseColor = MaterialColor.blueGrey.darken4
        alarmButton.tintColor = MaterialColor.red.base
        alarmButton.setImage(image, forState: .Normal)
        alarmButton.setImage(image, forState: .Highlighted)
        contentView.addSubview(alarmButton)
        
        imageView.grid.columns = 6
        
        contentView.grid.columns = 6
        
        cardView.grid.views = [
            imageView,
            contentView
        ]
        
        titleLabel.grid.rows = 2
        titleLabel.grid.columns = 9
        
        moreButton.grid.rows = 2
        moreButton.grid.columns = 3
        moreButton.grid.offset.columns = 9
        
        detailLabel.grid.rows = 4
        detailLabel.grid.offset.rows = 4
        
        alarmLabel.grid.rows = 2
        alarmLabel.grid.offset.rows = 10
        alarmLabel.grid.columns = 9
        
        alarmButton.grid.rows = 2
        alarmButton.grid.offset.rows = 10
        alarmButton.grid.columns = 3
        alarmButton.grid.offset.columns = 9
        
        contentView.grid.spacing = 8
        contentView.grid.axis.inherited = false
        contentView.grid.axis.direction = .None
        contentView.grid.contentInsetPreset = .Square3
        contentView.grid.views = [
            titleLabel,
            moreButton,
            detailLabel,
            alarmLabel,
            alarmButton
        ]
    }
    
    
    /// Prepares the medium card example.
    private func prepareLargeCardViewExample() {
        var image: UIImage? = UIImage(named: "CosmicMindInverted")
        
        let cardView: MaterialPulseView = MaterialPulseView(frame: CGRectMake(16, 100, view.bounds.width - 32, 400))
        cardView.pulseColor = MaterialColor.blueGrey.base
        cardView.depth = .Depth1
        view.addSubview(cardView)
        
        let leftImageView: MaterialView = MaterialView()
        leftImageView.image = image
        leftImageView.contentsGravity = .ResizeAspectFill
        cardView.addSubview(leftImageView)
        
        let topImageView: MaterialView = MaterialView()
        topImageView.image = image
        topImageView.contentsGravity = .ResizeAspectFill
        cardView.addSubview(topImageView)
        
        let bottomImageView: MaterialView = MaterialView()
        bottomImageView.image = image
        bottomImageView.contentsGravity = .ResizeAspectFill
        cardView.addSubview(bottomImageView)
        
        let contentView: MaterialView = MaterialView()
        contentView.backgroundColor = MaterialColor.clear
        cardView.addSubview(contentView)
        
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Material"
        titleLabel.textColor = MaterialColor.blueGrey.darken4
        titleLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(titleLabel)
        
        image = UIImage(named: "ic_more_horiz_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let moreButton: FlatButton = FlatButton()
        //moreButton.contentInsetPreset = .None
        moreButton.pulseColor = MaterialColor.blueGrey.darken4
        moreButton.tintColor = MaterialColor.blueGrey.darken4
        moreButton.setImage(image, forState: .Normal)
        moreButton.setImage(image, forState: .Highlighted)
        contentView.addSubview(moreButton)
        
        let detailLabel: UILabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = .ByTruncatingTail
        detailLabel.font = RobotoFont.regularWithSize(12)
        detailLabel.text = "Express your creativity with Material, an animation and graphics framework for Google's Material Design and Apple's Flat UI in Swift."
        detailLabel.textColor = MaterialColor.blueGrey.darken4
        detailLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(detailLabel)
        
        let alarmLabel: UILabel = UILabel()
        alarmLabel.font = RobotoFont.regularWithSize(12)
        alarmLabel.text = "34 min"
        alarmLabel.textColor = MaterialColor.blueGrey.darken4
        alarmLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(alarmLabel)
        
        image = UIImage(named: "ic_alarm_white")?.imageWithRenderingMode(.AlwaysTemplate)
        let alarmButton: FlatButton = FlatButton()
        //alarmButton.contentInsetPreset = .None
        alarmButton.pulseColor = MaterialColor.blueGrey.darken4
        alarmButton.tintColor = MaterialColor.red.base
        alarmButton.setImage(image, forState: .Normal)
        alarmButton.setImage(image, forState: .Highlighted)
        contentView.addSubview(alarmButton)
        
        leftImageView.grid.rows = 7
        leftImageView.grid.columns = 6
        
        topImageView.grid.rows = 4
        topImageView.grid.columns = 6
        topImageView.grid.offset.columns = 6
        
        bottomImageView.grid.rows = 3
        bottomImageView.grid.offset.rows = 4
        bottomImageView.grid.columns = 6
        bottomImageView.grid.offset.columns = 6
        
        contentView.grid.rows = 5
        contentView.grid.offset.rows = 7
        
        cardView.grid.axis.direction = .None
        cardView.grid.spacing = 4
        cardView.grid.views = [
            leftImageView,
            topImageView,
            bottomImageView,
            contentView
        ]
        
        titleLabel.grid.rows = 3
        titleLabel.grid.columns = 8
        
        moreButton.grid.rows = 3
        moreButton.grid.columns = 2
        moreButton.grid.offset.columns = 10
        
        detailLabel.grid.rows = 6
        detailLabel.grid.offset.rows = 3
        
        alarmLabel.grid.rows = 3
        alarmLabel.grid.columns = 8
        alarmLabel.grid.offset.rows = 9
        
        alarmButton.grid.rows = 3
        alarmButton.grid.offset.rows = 9
        alarmButton.grid.columns = 2
        alarmButton.grid.offset.columns = 10
        
        contentView.grid.spacing = 8
        contentView.grid.axis.inherited = false
        contentView.grid.axis.direction = .None
        contentView.grid.contentInsetPreset = .Square3
        contentView.grid.views = [
            titleLabel,
            moreButton,
            detailLabel,
            alarmLabel,
            alarmButton
        ]
    }
}





extension gridViewController:UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        
        let cardView: MaterialPulseView = MaterialPulseView(frame: CGRectMake(16, 100, view.bounds.width - 32, 152))
        cardView.pulseColor = MaterialColor.blueGrey.base
        cardView.depth = .Depth1
        view.addSubview(cardView)
        
        var image: UIImage? = UIImage(named: "ipad")
        let imageView: MaterialView = MaterialView()
        imageView.image = iconArray[indexPath.row]
        imageView.contentsGravity = .ResizeAspect
        cardView.addSubview(imageView)
        
        let contentView: MaterialView = MaterialView()
        contentView.backgroundColor = MaterialColor.clear
        cardView.addSubview(contentView)
        
        let titleLabel: UILabel = UILabel()
        titleLabel.text = titleArray[indexPath.row]
        titleLabel.textColor = MaterialColor.blue.darken1
        titleLabel.backgroundColor = MaterialColor.clear
        titleLabel.textAlignment = NSTextAlignment.Left
        contentView.addSubview(titleLabel)
        
//        image = UIImage(named: "ic_more_vert_white")?.imageWithRenderingMode(.AlwaysTemplate)
//        let moreButton: FlatButton = FlatButton()
//        //        moreButton.contentInsetPreset = .None
//        moreButton.pulseColor = MaterialColor.blueGrey.darken4
//        moreButton.tintColor = MaterialColor.blueGrey.darken4
//        moreButton.setImage(image, forState: .Normal)
//        moreButton.setImage(image, forState: .Highlighted)
//        contentView.addSubview(moreButton)
        
        let detailLabel: UILabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.lineBreakMode = .ByWordWrapping
        detailLabel.font = RobotoFont.regularWithSize(12)
        detailLabel.text = contentArray[indexPath.row]
        detailLabel.textColor = MaterialColor.blueGrey.darken4
        detailLabel.backgroundColor = MaterialColor.clear
        contentView.addSubview(detailLabel)
        
//        let alarmLabel: UILabel = UILabel()
//        alarmLabel.font = RobotoFont.regularWithSize(12)
//        alarmLabel.text = "34 min"
//        alarmLabel.textColor = MaterialColor.blueGrey.darken4
//        alarmLabel.backgroundColor = MaterialColor.clear
//        //contentView.addSubview(alarmLabel)
//        
//        image = UIImage(named: "ic_alarm_white")?.imageWithRenderingMode(.AlwaysTemplate)
//        let alarmButton: FlatButton = FlatButton()
//        //alarmButton.contentInsetPreset = .None
//        alarmButton.pulseColor = MaterialColor.blueGrey.darken4
//        alarmButton.tintColor = MaterialColor.red.base
//        alarmButton.setImage(image, forState: .Normal)
//        alarmButton.setImage(image, forState: .Highlighted)
        //contentView.addSubview(alarmButton)
        
        imageView.grid.columns = 4
        
        contentView.grid.columns = 8
        
        cardView.grid.views = [
            imageView,
            contentView
        ]
        
        titleLabel.grid.rows = 3
        titleLabel.grid.columns = 9
//        
//        moreButton.grid.rows = 3
//        moreButton.grid.columns = 2
//        moreButton.grid.offset.columns = 10
        
        detailLabel.grid.rows = 4
        detailLabel.grid.offset.rows = 3
        
//        alarmLabel.grid.rows = 3
//        alarmLabel.grid.offset.rows = 9
//        alarmLabel.grid.columns = 9
//        
//        alarmButton.grid.rows = 3
//        alarmButton.grid.offset.rows = 9
//        alarmButton.grid.columns = 2
//        alarmButton.grid.offset.columns = 10
        
        contentView.grid.spacing = 10
        contentView.grid.axis.inherited = false
        contentView.grid.axis.direction = .None
        contentView.grid.contentInsetPreset = .None
        contentView.grid.views = [
            titleLabel,
            //moreButton,
            detailLabel,
            //alarmLabel,
            //alarmButton
        ]

        
        cell.contentView.addSubview(cardView)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.backgroundColor = UIColor.clearColor()

        return cell
    }
    
    func imageWithImage(image:UIImage,scaledToSize newSize:CGSize)->UIImage{
        
        UIGraphicsBeginImageContext( newSize )
        image.drawInRect(CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage.imageWithRenderingMode(.AlwaysTemplate)
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
        if indexPath.row == 4 {
            return 179
        }
        return 175
    }

    
    
}


