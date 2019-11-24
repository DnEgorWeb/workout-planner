//
//  WorkoutsVC.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 20/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutsVC: UIViewController {
    weak var coordinator: WorkoutCoordinator?
    var workoutsView = Workouts()
    var dataSource = ObjectDataSource()
    var tableDelegate = ObjectTableViewDelegate()

    override func loadView() {
        super.loadView()
        
        workoutsView.tableView.dataSource = dataSource
        workoutsView.tableView.delegate = tableDelegate
        
        setupSections()
        setupNewGroupButton()
        
        view = workoutsView
    }
    
    func setupSections() {
        let workoutModes = workoutsView.workoutModes
        workoutModes.addTarget(self, action: #selector(segmentedControlTapped(sender:)), for: .valueChanged)
        navigationItem.titleView = workoutModes
    }
    
    func setupNewGroupButton() {
        let newWorkoutButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newGroupTapped))
        newWorkoutButton.tintColor = .orange
        navigationItem.rightBarButtonItem = newWorkoutButton
    }
}

// MARK: - Selectors
extension WorkoutsVC {
    @objc func newGroupTapped() {
        coordinator?.createNewGroup()
    }
    
    @objc func segmentedControlTapped(sender: UISegmentedControl) {
        navigationItem.rightBarButtonItem?.isEnabled = sender.selectedSegmentIndex != 2
    }
}
