//
//  AppDelegate.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let viewController = LoginController()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        
        UINavigationBar.appearance().barTintColor = UIColor().HexToColor(hexString: "#D63031", alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor().HexToColor(hexString: "#ABAFB0", alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor().HexToColor(hexString: "#FFFFFF", alpha: 1)]
        UINavigationBar.appearance().barStyle = .blackOpaque
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        print(url.queryDictionary)
        NotificationCenter.default.post(name: .signedInFromURL, object: url.queryDictionary)
        
        return true
    }
}

