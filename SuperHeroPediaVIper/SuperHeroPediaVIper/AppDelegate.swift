//
//  AppDelegate.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 21/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let router = SuperHeroRouter.startExecution()
        let initialVC = router.entry!
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let sb = UIStoryboard(name: "MainSuperHeroView", bundle: nil)
//        let initialVc = sb.instantiateViewController(withIdentifier: "SuperHeroViewId")
        
        window?.makeKeyAndVisible()
        window?.rootViewController = initialVC
        return true
    }
}

