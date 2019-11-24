//
//  ProgressCoordinator.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class ProgressCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        start()
    }
    
    func start() {
        let vc = ProgressVC()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(title: "Progress", image: UIImage(named: "progress"), tag: 1)
        vc.title = "Progress"
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
