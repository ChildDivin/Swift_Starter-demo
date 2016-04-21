//
//  AppDelegate.swift
//  Booking_system
//
//  Created by Tops on 4/20/16.
//  Copyright © 2016 Tops. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var nav : UINavigationController?
    var locationManager:CLLocationManager!
    var navslide : UINavigationController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.statusBarHidden=true
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let firsttimeappobj: LoginVC  = LoginVC(nibName:"LoginVC",bundle:nil)
        
        nav = UINavigationController(rootViewController: firsttimeappobj)
        nav?.interactivePopGestureRecognizer?.enabled = false
        nav?.navigationBar.hidden = true;
        window?.rootViewController=nav
        window?.makeKeyAndVisible()
        
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

    // MARK: - Loader Start/Stop Methods
    func startSpinerWithOverlay (overlay: Bool) {
        self.stopSpiner()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        MBProgressHUD.showHUDAddedTo(appDelegate.window, animated: true)
        
    }
    
    func stopSpiner() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        MBProgressHUD.hideAllHUDsForView(appDelegate.window, animated: true)
        
    }

}

