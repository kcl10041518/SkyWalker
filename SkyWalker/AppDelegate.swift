//
//  AppDelegate.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit

//@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        startMainPageApp();
        let string = "sss.pg"
        if (string.range(of: ".png") != nil) {
            print("test")
        }
        // Override point for customization after application launch.
        return true
    }
    
    
    private func startLoginPageApp() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = SkyWalkerLoginViewController()
        window?.makeKeyAndVisible()
    }
    
    
    private func startMainPageApp() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = SkyWalkerTabbarController()
        window?.makeKeyAndVisible()
    }


}

