//
//  AppDelegate.swift
//  DessertDisplayer
//
//  Created by Michael  Walter on 6/5/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MealListVC()
        window?.makeKeyAndVisible()
        
        return true
    }
}

