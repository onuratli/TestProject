//
//  ContactViewController.swift
//  TestProject
//
//  Created by Onur Atlı on 16/02/16.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit
import MapKit
import Material

class ContactViewController: UIViewController {
    var mapView: MKMapView!
    var tblView: UITableView = UITableView()
    var contentArray:[String] = ["Vali Konağı Cad. 23/A Nişantaşı" , "info@mirzaturizm.com.tr", "+90 212 241 03 45" , "+09 212 241 03 05"]
    //var iconArray:[String] = ["home" , "email", "phone" , "printer"]
    var iconArray: [UIImage] = [UIImage(named: "home")!, UIImage(named: "mail")!,UIImage(named: "phone")!, UIImage(named: "printer")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.dataSource = self
        tblView.delegate = self
        tblView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        let menuImage = UIImage(named: "hamburger")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: UIBarButtonItemStyle.Plain, target: slideMenuController(), action: "openLeft")
        self.navigationItem.title = "İletişim"
        
        
        
        var mapView = MKMapView()

        mapView.frame = CGRectMake(0, 60, self.view.frame.width, self.view.frame.height - 250)
        mapView.mapType = MKMapType.Standard
        mapView.zoomEnabled = true
        mapView.scrollEnabled = true
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.01 , 0.01)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 41.049799, longitude: 28.988365)
        let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        
        mapView.setRegion(theRegion, animated: true)
        
        var anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = "Mirza Travel Group"
        //anotation.subtitle = "444 4 679"
        
        mapView.addAnnotation(anotation)
        
        
        self.view.addSubview(mapView)
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.drawInRect(self.view.bounds)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)

        //self.view.backgroundColor = MaterialColor.amber.accent1
        var height:CGFloat = self.view.frame.height-200

        
        tblView.frame = CGRect(x: 0, y: height, width: self.view.frame.width, height: 300)
        tblView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(tblView)
        
        let navigationBgColor = UIColor(red: 59, green: 175, blue: 218)
        navigationController!.navigationBar.barTintColor = navigationBgColor
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

    
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







extension ContactViewController:UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menu:UITableViewCell = tblView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        menu.textLabel?.text = contentArray[indexPath.row]
        

        menu.imageView?.image = imageWithImage(iconArray[indexPath.row], scaledToSize: CGSize(width: 25, height: 25)).imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        menu.backgroundColor = UIColor.clearColor() 
        return menu
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
    
    
    
    
}

