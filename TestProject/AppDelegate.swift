//
//  AppDelegate.swift
//  TestProject
//
//  Created by Onur Atlı on 5.02.2016.
//  Copyright © 2016 Onur Atlı. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // lvc olarak tanımladığımız şey ise, aşağıdaki slidemenucontroler'ın içine atacağımız ve onun da belirttiği üzere "leftmenuviewcontroller"dır. ben buraya onurviewcontroller'da yazabilirdim. Hangi viewcontroller'ın senin solda tıkladığında açılacak viewcontroller'ın ise, onu yazacaksın. zaten mavi ve kırmızı kullanmamın nedeni bu.
        
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = UIColor.blackColor()
        let lvc = LeftViewController()

        let navController = UINavigationController(rootViewController: lvc.homeViewController)
        
        // burada da mainviewcontroller'ı oluşturduk. ve bu oluşturduğumuz HomeViewController sınıfından türemiş değişkeni yine SlideMenuController'ın içine koyuyoruz. 
        
        //let mainViewController = HomeViewController()
        let slideMenuController = SlideMenuController(mainViewController: navController, leftMenuViewController: lvc)
        
        // bunlar ise adı üzerinde rootviewController, yani senin aslında main viewcontrollerını belirliyor. biz aşağıdaa slideview controller yerine mainviewcontroller yazarsak; mainviewcontrollerı çalıştırır.
        
        
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

