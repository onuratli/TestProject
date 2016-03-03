//
//  CardViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 09/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//  İdol ©  Ali Ersöz
//

import UIKit
import Material

class CardViewController: UIViewController , UIScrollViewDelegate{
    var ItemArray:[CardProperites] = []
    var scrollView : UIScrollView!
    var containerView : UIView!

    var titleArray:[String] = ["Statü Puan Barajı","Statü Geciş Bedeli","Statü Geçiş Hediyesi","Uçak Biletlerinize Hediye","Statü Yenileme Koşulları","Vizenize Hediye", "Statü Puanı Satın Alma Hakkı", "Otel ve Tatil Paketlerinize Hediye", "Taksit / Komisyon" ,"Kartın Geçerlilik Süresi","Puan Geçerlilik Süresi", "VIP Transfer Hizmeti"]
   
    var contentArray:[String] = [" - " , " - ", " - " , "İç Hat; 2 TL - Dış Hat; 5 TL" , " - " , " 5 TL " , " - " , " - ", " Tek Çekimde 0 Komisyon" , " 1 Yıl" , "2 Yıl" , " - "]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Classic Card"

        
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(1024, 2000)
        
        containerView = UIView()
        
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)

        
        
        
        prepareView()
        //prepareGeneralCardViewExample()
        
        
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
       
        var height:CGFloat = 25


        
       for var index = 0; index < titleArray.count; ++index {
           
           let statuView : CardView = CardView()
           
        
           let statuTitle: UILabel = UILabel()
           statuTitle.text = titleArray[index]
           statuTitle.textColor = MaterialColor.blue.darken1
           statuTitle.font = RobotoFont.mediumWithSize(15)
           statuView.titleLabel = statuTitle
        
           
           let statuLabel: UILabel = UILabel()
           statuLabel.text = contentArray[index]
           statuLabel.numberOfLines = 0
           statuView.detailView = statuLabel
           
           
           self.containerView.addSubview(statuView)
           statuView.translatesAutoresizingMaskIntoConstraints = false
           MaterialLayout.alignFromTop(view, child: statuView, top: height)
           MaterialLayout.alignToParentHorizontally(view, child: statuView, left: 20, right: 20)
           statuView.divider  = false
           statuView.layer.cornerRadius = 5
           height += 100
           print("Yüseklik " , statuView.layer.frame.height)
        

       }
}
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        containerView.frame = self.view.bounds
    }

    
    private func prepareView() {
        //self.view.backgroundColor = MaterialColor.deepOrange
    }
    
    
    private func prepareGeneralCardViewExample() {
        
        ItemArray.append(classic())
        ItemArray.append(gold())
        
        let cardView: CardView = CardView()
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Statü Geçiş Puan Barajları"
        titleLabel.textColor = MaterialColor.blue.darken1
        titleLabel.font = RobotoFont.mediumWithSize(20)
        cardView.titleLabel = titleLabel
        
        
        cardView.divider = false
        // Detail label.
        let detailLabel: UILabel = UILabel()
        detailLabel.text = " - "
        detailLabel.numberOfLines = 0
        cardView.detailView = detailLabel
        
        let GeciscardView: CardView = CardView()

        
        let gecisTitleLabel: UILabel = UILabel()
        gecisTitleLabel.text = "Statü Geçiş Bedeli"
        gecisTitleLabel.textColor = MaterialColor.blue.darken1
        gecisTitleLabel.font = RobotoFont.mediumWithSize(20)
        GeciscardView.titleLabel = gecisTitleLabel
        
        
        
        
        
        let gecisBedeli: UILabel = UILabel()
        gecisBedeli.text = " - "
        gecisBedeli.numberOfLines = 0
        GeciscardView.detailView = gecisBedeli
        
        print("array countu", ItemArray.count)
        
        // Yes button.
        
//        let btn1: FlatButton = FlatButton()
//        btn1.pulseColor = MaterialColor.blue.lighten1
//        btn1.pulseScale = false
//        btn1.setTitle("Evet", forState: .Normal)
//        btn1.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)
//        
        // No button.
        
//        let btn2: FlatButton = FlatButton()
//        btn2.pulseColor = MaterialColor.blue.lighten1
//        btn2.pulseScale = false
//        btn2.setTitle("Hayır", forState: .Normal)
//        btn2.setTitleColor(MaterialColor.blue.darken1, forState: .Normal)
        
        // Add buttons to left side.
//        cardView.leftButtons = [btn1, btn2]
    
        // To support orientation changes, use MaterialLayout.
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: cardView, top: 100)
        MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
        cardView.layer.cornerRadius = 5
        
        
        view.addSubview(GeciscardView)
        GeciscardView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: GeciscardView, top: 200)
        MaterialLayout.alignToParentHorizontally(view, child: GeciscardView, left: 20, right: 20)
        GeciscardView.divider  = false
        GeciscardView.layer.cornerRadius = 5
        
        
        
        
        //Uçak Biletlerinize Hediye:

        let biletHediyeView: CardView = CardView()
        
        
        let biletHediyeTitle: UILabel = UILabel()
        biletHediyeTitle.text = "Uçak Biletlerinize Hediye"
        biletHediyeTitle.textColor = MaterialColor.blue.darken1
        biletHediyeTitle.font = RobotoFont.mediumWithSize(20)
        biletHediyeView.titleLabel = biletHediyeTitle
        
        
        
        
        
        let hediyeLabel: UILabel = UILabel()
        hediyeLabel.text = " İç Hat; 2 TL  Dış Hat; 5 TL "
        hediyeLabel.numberOfLines = 0
        biletHediyeView.detailView = hediyeLabel

        
        view.addSubview(biletHediyeView)
        biletHediyeView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: biletHediyeView, top: 300)
        MaterialLayout.alignToParentHorizontally(view, child: biletHediyeView, left: 20, right: 20)
        biletHediyeView.divider  = false
        biletHediyeView.layer.cornerRadius = 5
        
        
        
        
        
        //statü yenileme koşulu
        
        
        let statuView: CardView = CardView()
        
        
        let statuTitle: UILabel = UILabel()
        statuTitle.text = "Statü Yenileme Koşulları"
        statuTitle.textColor = MaterialColor.blue.darken1
        statuTitle.font = RobotoFont.mediumWithSize(20)
        statuView.titleLabel = statuTitle
        
        
        
        
        
        let statuLabel: UILabel = UILabel()
        statuLabel.text = " - "
        statuLabel.numberOfLines = 0
        statuView.detailView = statuLabel
        
        
        view.addSubview(statuView)
        statuView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: statuView, top: 400)
        MaterialLayout.alignToParentHorizontally(view, child: statuView, left: 20, right: 20)
        statuView.divider  = false
        statuView.layer.cornerRadius = 5
        
        
        //
        

        var height:CGFloat = 500

        for var index = 0; index < titleArray.count; ++index {
            
            let xstatuView : CardView = CardView()
            
            
            let xstatuTitle: UILabel = UILabel()
            xstatuTitle.text = titleArray[index]
            xstatuTitle.textColor = MaterialColor.blue.darken1
            xstatuTitle.font = RobotoFont.mediumWithSize(20)
            xstatuView.titleLabel = xstatuTitle
            
            
            
            
            
            let xstatuLabel: UILabel = UILabel()
            xstatuLabel.text = "selam"
            xstatuLabel.numberOfLines = 0
            xstatuView.detailView = xstatuLabel
            
            
            view.addSubview(xstatuView)
            xstatuView.translatesAutoresizingMaskIntoConstraints = false
            MaterialLayout.alignFromTop(view, child: xstatuView, top: height)
            MaterialLayout.alignToParentHorizontally(view, child: xstatuView, left: 20, right: 20)
            xstatuView.divider  = false
            xstatuView.layer.cornerRadius = 5
            height += 100
        }

        
    }
    
    /**
     :name:	prepareCardViewWithoutPulseBackgroundImageExample
     :description:	An example of the CardView without the pulse animation and an added background image.
     */
    private func prepareCardViewWithoutPulseBackgroundImageExample() {
        let cardView: CardView = CardView()
        cardView.divider = false
        cardView.backgroundColor = MaterialColor.red.base
        cardView.pulseScale = false
        cardView.pulseColor = nil
        
        cardView.image = UIImage(named: "Material-iTunesArtWork")?.resize(toHeight: 150)
        cardView.contentsGravity = .BottomRight
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Material"
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.mediumWithSize(24)
        cardView.titleLabel = titleLabel
        
        // Detail label.
        let detailLabel: UILabel = UILabel()
        detailLabel.text = "Beautiful Material Design"
        detailLabel.textColor = MaterialColor.white
        detailLabel.numberOfLines = 0
        cardView.detailView = detailLabel
        
        // Favorite button.
        let img1: UIImage? = UIImage(named: "ic_favorite_white")
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.white
        btn1.pulseScale = false
        btn1.setImage(img1, forState: .Normal)
        btn1.setImage(img1, forState: .Highlighted)
        
        // Add buttons to left side.
        cardView.leftButtons = [btn1]
        
        // To support orientation changes, use MaterialLayout.
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: cardView, top: 100)
        MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
    }
    
    /**
     :name:	prepareCardViewWithPulseBackgroundImageExample
     :description:	An example of the CardView with the pulse animation and an added background image.
     */
    private func prepareCardViewWithPulseBackgroundImageExample() {
        let cardView: CardView = CardView()
        cardView.backgroundColor = MaterialColor.blue.base
        cardView.divider = false
        
        // Image.
        cardView.image = UIImage(named: "Graph")?.resize(toHeight: 150)
        cardView.contentsGravity = .Right
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Graph"
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.mediumWithSize(24)
        cardView.titleLabel = titleLabel
        
        // Detail label.
        let detailLabel: UILabel = UILabel()
        detailLabel.text = "Data-Driven Framework"
        detailLabel.textColor = MaterialColor.white
        detailLabel.numberOfLines = 0
        cardView.detailView = detailLabel
        
        // Favorite button.
        let img1: UIImage? = UIImage(named: "ic_favorite_white")
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.white
        btn1.pulseScale = false
        btn1.setImage(img1, forState: .Normal)
        btn1.setImage(img1, forState: .Highlighted)
        
        // Add buttons to left side.
        cardView.leftButtons = [btn1]
        
        // To support orientation changes, use MaterialLayout.
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: cardView, top: 100)
        MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
    }
    
    /**
     :name:	prepareCardViewButtonBarExample
     :description:	An example of the CardView with only buttons to create a button bar.
     */
    private func prepareCardViewButtonBarExample() {
        let cardView: CardView = CardView()
        cardView.divider = false
        cardView.pulseColor = nil
        cardView.pulseScale = false
        cardView.backgroundColor = MaterialColor.blueGrey.darken4
        
        // Favorite button.
        let img1: UIImage? = UIImage(named: "ic_search_white")
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.white
        btn1.pulseScale = false
        btn1.setImage(img1, forState: .Normal)
        btn1.setImage(img1, forState: .Highlighted)
        
        // BUTTON 1 button.
        let btn2: FlatButton = FlatButton()
        btn2.pulseColor = MaterialColor.teal.lighten3
        btn2.pulseScale = false
        btn2.setTitle("BUTTON 1", forState: .Normal)
        btn2.setTitleColor(MaterialColor.teal.lighten3, forState: .Normal)
        btn2.titleLabel!.font = RobotoFont.regularWithSize(20)
        
        // BUTTON 2 button.
        let btn3: FlatButton = FlatButton()
        btn3.pulseColor = MaterialColor.teal.lighten3
        btn3.pulseScale = false
        btn3.setTitle("BUTTON 2", forState: .Normal)
        btn3.setTitleColor(MaterialColor.teal.lighten3, forState: .Normal)
        btn3.titleLabel!.font = RobotoFont.regularWithSize(20)
        
        // Add buttons to left side.
        cardView.leftButtons = [btn1]
        
        // Add buttons to right side.
        cardView.rightButtons = [btn2, btn3]
        
        // To support orientation changes, use MaterialLayout.
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        MaterialLayout.alignFromTop(view, child: cardView, top: 100)
        MaterialLayout.alignToParentHorizontally(view, child: cardView, left: 20, right: 20)
    }

}

class CardProperites{

    var gecisBaraji:String?
    var gecisBedeli:String?
    var gecisHediyesi:String?
    var biletHediye:String?
    var statuYenileme:String?
    var vizeHediye:String?
    var puanSatinAlma:String?
    var tatilHediye:String?
    var taksit:String?
    var gecerlilikSuresi:String?
    var puanGecerlilikSuresi:String?
    var vipTransfer:String?

}





func classic() -> CardProperites
{
    
    
    [" - " , " - ", " - " , "İç Hat; 2 TL - Dış Hat; 5 TL" , " - " , " 5 TL " , " - " , " - ", " Tek Çekimde 0 Komisyon" , " 1 Yıl" , "2 Yıl" , " - "]
    
    
    
    var classicCard = CardProperites()
    classicCard.gecisBaraji = " - "
    classicCard.gecisBedeli = " - "
    classicCard.gecisHediyesi = " - "
    classicCard.biletHediye = "İç Hat; 2 TL - Dış Hat; 5 TL"
    
    classicCard.statuYenileme = " - "
    classicCard.vizeHediye  = " 5 TL "
    classicCard.puanSatinAlma = " - "
    classicCard.tatilHediye = " - "
    classicCard.taksit  = " Tek Çekimde 0 Komisyon"
    classicCard.gecerlilikSuresi = " 1 Yıl"
    classicCard.puanGecerlilikSuresi = "2 Yıl"
    classicCard.vipTransfer = " - "
    return classicCard
    
}

enum cardTitle: String {
    
    
    case gecisBaraji = "Statü Puan Barajı"
    case gecisBedeli = "Statü Geciş Bedeli"
    case gecisHediyesi = "Statü Geçiş Hediyesi"
    case biletHediye = "Uçak Biletlerinize Hediye"
    case statuYenileme = "Statü Yenileme Koşulları"
    case vizeHediye = "Vizenize Hediye"
    case puanSatınAlma = "Statü Puanı Satın Alma Hakkı"
    case tatilHediye = "Otel ve Tatil Paketlerinize Hediye"
    case taksit = "Taksit / Komisyon"
    case gecerlilik = "Kartın Geçerlilik Süresi"
    case puanGecerlilik = "Puan Geçerlilik Süresi"
    case vipTransfer = "VIP Transfer Hizmeti"
}


func gold() -> CardProperites
{
    var goldCard = CardProperites()
    
    
    
    goldCard.gecisBaraji = " 30.000 Puan "
    goldCard.gecisBedeli = " - 30.000 Puan "
    goldCard.gecisHediyesi = " Ipad mini "
    goldCard.biletHediye = "İç Hat; 3 TL - Dış Hat; 7 TL"
    
    goldCard.statuYenileme = " İlk 6 ayda 20.000 puan ya da 1 yılda 40.000 puan "
    goldCard.vizeHediye  = " 10 TL "
    goldCard.puanSatinAlma = "Maximum 10.000 puan"
    goldCard.tatilHediye = " Yurt İçi; 10 TL Yurt Dışı; 15 TL "
    goldCard.taksit  = " 2 Taksite Vade Farksız "
    goldCard.gecerlilikSuresi = " 1 Yıl"
    goldCard.puanGecerlilikSuresi = "2 Yıl"
    goldCard.vipTransfer = " - "
    return goldCard
}










class Foo {
    
    
    
    
    var name: String?    = "oNUR ATLI"       // instance property
    
    
    
    
//    static var all = [Foo]()    // static type property
//    class var comp: Int {       // computed type property
//        return 42
//    }
//    
//    class func alert() {        // type method
//        print("There are \(all.count) foos")
//    }
    
    
}
