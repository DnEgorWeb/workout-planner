//
//  WorkoutCoordinator.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutCoordinator: Coordinator {
    weak var presentationController: UIViewController?
    var navigationController: UINavigationController
    weak var createGroupController: CreateGroupVC?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        // if isFirst run then show welcome view controller instread
        start()
    }
    
    func start() {
        let vc = WorkoutsVC()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(title: "Workouts", image: UIImage(named: "workouts"), tag: 0)
        navigationController.navigationBar.tintColor = .orange
        navigationController.pushViewController(vc, animated: true)
        presentationController = vc
    }
    
    func createNewGroup() {
        let vc = CreateGroupVC()
        let navController = UINavigationController(rootViewController: vc)
        navController.navigationBar.tintColor = .orange
        vc.coordinator = self
        vc.title = "New Group"
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNewGroup))
        vc.navigationItem.rightBarButtonItem?.isEnabled = false
        vc.navigationItem.backBarButtonItem?.tintColor = .orange
        createGroupController = vc
        
        navigationController.present(navController, animated: true)
    }
    
    @objc func saveNewGroup() {
        guard let createGroupView = createGroupController?.view as? CreateGroup else { return }
        
        let imageCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImageCell
        let image = imageCell?.groupImageView.image
        let titleCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextCell
        let title = titleCell?.titleTextField.text
        let typeCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? TypeCell
        let type = typeCell?.type
        let subtitleCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 2, section: 0))  as? TextCell
        let subtitle = subtitleCell?.titleTextField.text
        
        let newGroup = Group(title: title!, subtitle: subtitle, image: image, type: type)
        
        let workoutVC = presentationController as? WorkoutsVC
        workoutVC?.updateData(newGroup: newGroup)
        navigationController.topViewController?.dismiss(animated: true)
    }
}
