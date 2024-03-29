//
//  AppDelegate.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let root = HomeBuilder.build()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.tintColor = AppTheme.shared.enabledBackgroundColor
        window.rootViewController = root
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
