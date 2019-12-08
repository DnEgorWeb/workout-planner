//
//  AppDelegate.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 19/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let defaults = UserDefaults.standard
//        if defaults.bool(forKey: "isFirstLaunch") == false {
//            let workoutsData: [Group] = [
//                Group(title: "Monday", subtitle: "Hands and chest", image: #imageLiteral(resourceName: "emptyGroup"), type: .strength),
//                Group(title: "Friday", subtitle: "Legs and ABS", image: #imageLiteral(resourceName: "emptyGroup"), type: .strength),
//                Group(title: "Tabata", subtitle: "Legs", image: #imageLiteral(resourceName: "emptyGroup"), type: .cardio),
//                Group(title: "Group title", subtitle: "Group subtitle", image: #imageLiteral(resourceName: "emptyGroup"), type: .custom),
//            ]
//
//            let realm = try! Realm()
//            try! realm.write {
//                for group in workoutsData {
//                    realm.add(group)
//                }
//            }
//            // then:
//            // defaults.set(true, forKey: "isFirstLaunch")
//        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

