//
//  ViewController.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 19/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar();
    }
}

//Mark: nav controller
extension MainTabBarController {
    func setupTabBar() {
        UITabBar.appearance().tintColor = .orange
        let workoutsController = createNavController(vc: WorkoutsVC(), image: #imageLiteral(resourceName: "workouts"), title: "Workouts")
        let progressController = createNavController(vc: ProgressVC(), image: #imageLiteral(resourceName: "progress"),  title: "My progress")
        let stopwatchController = createNavController(vc: StopwatchVC(), image: #imageLiteral(resourceName: "stopwatch"),  title: "Stopwatch")
        viewControllers = [workoutsController, progressController, stopwatchController]
    }
    
    func createNavController(vc: UIViewController, image: UIImage, title: String) -> UINavigationController {
        let viewController = vc
        viewController.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = image
        return navController
    }
}
