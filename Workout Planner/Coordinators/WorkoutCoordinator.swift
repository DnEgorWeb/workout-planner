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
    weak var createExerciseController: CreateExerciseVC?
    
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
        presentationController = vc
        
        setupSections()
        setupNewGroupButton()
    }
    
    func createNewGroup(mode: ModeTypes, groupData: Group?, indexPath: IndexPath?) {
        let vc = CreateGroupVC(mode: mode)
        
        if mode == .edit {
            vc.groupData = groupData
            vc.indexPath = indexPath
        }
        
        let navController = UINavigationController(rootViewController: vc)

        vc.coordinator = self
        vc.title = mode == .create ? "New Group" : "Edit Group"
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNewGroup))
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissController))
        
        vc.navigationItem.rightBarButtonItem?.tintColor = .orange
        vc.navigationItem.leftBarButtonItem?.tintColor = .orange
        
        if mode == .create {
            vc.navigationItem.rightBarButtonItem?.isEnabled = false
        }
        createGroupController = vc
        
        navigationController.present(navController, animated: true)
    }
    
    func createNewExercise(type: GroupTypes) {
        let vc = CreateExerciseVC()
        
        vc.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        vc.coordinator = self
        vc.type = type
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNewExercise))
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissController))
        
        let navController = UINavigationController(rootViewController: vc)
        
        navigationController.present(navController, animated: true)
    }
    
    @objc func dismissController() {
        navigationController.topViewController?.dismiss(animated: true)
    }
    
    @objc func saveNewExercise() {
        
    }
    
    @objc func saveNewGroup() {
        guard let createGroupView = createGroupController?.view as? CreateGroup else { return }
        
        guard let imageCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImageCell else { return }
        let image = imageCell.groupImageView.image
        guard let titleCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TextCell else { return }
        let title = titleCell.titleTextField.text
        guard let typeCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? TypeCell else { return }
        let type = typeCell.type
        guard let subtitleCell = createGroupView.tableView.cellForRow(at: IndexPath(row: 2, section: 0))  as? TextCell  else { return }
        let subtitle = subtitleCell.titleTextField.text
        
        let newGroup = Group(title: title!, subtitle: subtitle, image: image, type: type)
        
        let workoutVC = presentationController as? WorkoutsVC
        
        if createGroupController?.mode == .edit {
            guard let indexPath = createGroupController?.indexPath else {
                dismissController()
                return
            }
            workoutVC?.modifyGroup(group: newGroup, indexPath: indexPath)
        } else {
            workoutVC?.createGroup(newGroup: newGroup)
            StorageManager.saveObject(newGroup)
        }

        dismissController()
    }
}

// MARK: header
extension WorkoutCoordinator {
    func setupSections() {
        let workoutModes = UISegmentedControl(items: ["My workouts", "Exercises", "Programs"])
        workoutModes.selectedSegmentIndex = 0
        
        if #available(iOS 13, *) {} else {
            workoutModes.tintColor = #colorLiteral(red: 0.3254901961, green: 0.7568627451, blue: 0.9843137255, alpha: 1)
        }
        
        workoutModes.addTarget(self, action: #selector(segmentedControlTapped(sender:)), for: .valueChanged)
        presentationController?.navigationItem.titleView = workoutModes
    }
    
    func setupNewGroupButton() {
        let newWorkoutButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonTapped))
        newWorkoutButton.tintColor = .orange
        presentationController?.navigationItem.rightBarButtonItem = newWorkoutButton
    }
    
    @objc func createButtonTapped() {
        guard let vc = presentationController as? WorkoutsVC else { return }
        guard let segmentedControl = vc.navigationItem.titleView as? UISegmentedControl else { return }
        
        let selectedSection = segmentedControl.selectedSegmentIndex
        
        if selectedSection == 0 {
            createNewGroup(mode: .create, groupData: nil, indexPath: nil)
        }
        
        if selectedSection == 1 {
            let ac = UIAlertController(title: "New exercise", message: "Please, select a type of new exercise", preferredStyle: .actionSheet)
            
            for type in GroupTypes.allCases {
                ac.addAction(UIAlertAction(title: type.rawValue, style: .default, handler: { (_) in
                    self.createNewExercise(type: type)
                }))
            }
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            navigationController.present(ac, animated: true)
        }
    }
    
    @objc func segmentedControlTapped(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        presentationController?.navigationItem.rightBarButtonItem?.isEnabled = selectedIndex != 2
        
        guard let vc = presentationController as? WorkoutsVC else { return }
        
        switch selectedIndex {
        case 1:
            vc.view = vc.exercisesView
        default:
            vc.view = vc.workoutsView
        }
    }
}
