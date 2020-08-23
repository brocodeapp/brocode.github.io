//
//  AppDelegate.swift
//  TransliteratingKeyboard
//
//  Created by Alexei Baboulevitch on 6/9/14.
//  Copyright (c) 2014 Alexei Baboulevitch ("Archagon"). All rights reserved.
//

import UIKit
import Flurry_iOS_SDK
import Firebase
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    let sessionID = UUID().uuidString

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Flurry.startSession("S6YFJRRYYXSCVSZKP5V9", with: FlurrySessionBuilder
        .init()
        .withCrashReporting(true)
        .withLogLevel(FlurryLogLevelAll))
        FirebaseApp.configure()
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        setCustomer()
        return true
    }
    
    func setCustomer() {
        if let userUniqueID = UIDevice.current.identifierForVendor {
            let vendorID = "\(userUniqueID)"
            Flurry.setUserID(vendorID)
            Analytics.logEvent("CUSTOMER_ID", parameters: [
            "VENDOR_ID": "\(vendorID)"])
            Flurry.logEvent("APP_Launch_WITH_CUSTOMER_ID")
        }
        
        Flurry.logEvent("APP_Launch", withParameters: ["Session_ID": "\(sessionID)"])
        Analytics.logEvent("APP_Launch", parameters: [
        "Session_ID": "\(sessionID)"])
        Flurry.logEvent("APP_Launch_WITH_SESSION_ID")        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

