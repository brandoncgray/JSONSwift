//
//  AppDelegate.swift
//  ExampleJSON
//
//  Created by Brandon Gray on 4/6/17.
//  Copyright © 2017 Brandon Gray. All rights reserved.
//

import UIKit
import JSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Register online or use the test code below.
        JSONRegistration.setup(company: "Test Company", registrationIDs:
            ["210a61f6c75c2dcd0cb663281eace40c1690810422498a04f4e2ab29216199a3"]
        )

        
        JSONSetup.set(option: .titlecased)
        JSONSetup.set(dateFormats: ["yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd'T'HH:mm:ss.SSS"]) // 2015-05-28T15:05:56 , 2015-05-28T15:05:56.277
        //JSONSetup.set(outputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS")
        JSONSetup.set(outputDateFormat: "yyyy-MM-dd")
//        JSONSetup.use(unixTimestamp: true)

        
        // EncryptDatabase set to true will force encrypt all data
        //JSONSetup.database(true)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

