//
//  WorkoutCoordinator.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        // if isFirst run then show welcome view controller instread
        start()
    }
    
    func start() {
        let vc = WorkoutsVC()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(title: "Workouts", image: UIImage(named: "workouts"), tag: 0)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createNewGroup() {
        let vc = CreateGroupVC()
        vc.coordinator = self
        vc.title = "New Group"
        vc.navigationItem.backBarButtonItem?.tintColor = .orange
        
        navigationController.pushViewController(vc, animated: true)
    }
}
