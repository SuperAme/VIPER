//
//  AppDelegate.swift
//  Cartoons
//
//  Created by Américo MQ on 14/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let router = CartoonsList_Router.startExecution()
        let initialViewController = router.entry!
        
        let navigation = UINavigationController()
        navigation.viewControllers = [initialViewController]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigation
        
        return true
        
    }
}

