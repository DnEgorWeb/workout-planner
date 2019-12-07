//
//  StopwatchCoordinator.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class StopwatchCoordinator: Coordinator {
    var presentationController: UIViewController?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        start()
    }
    
    func start() {
        let vc = StopwatchVC()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(title: "Stopwatch", image: UIImage(named: "stopwatch"), tag: 2)
        vc.title = "Stopwatch"
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
