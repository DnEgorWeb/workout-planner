//
//  WorkoutsVC.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 20/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutsVC: UIViewController {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!

    override func loadView() {
        super.loadView()
        safeArea = view.layoutMarginsGuide
        
        setupNewWorkoutButton()
        setupSections()
        setupTableView()
    }
}

// header bar
extension WorkoutsVC {
    func setupSections() {
        let titles = ["My workouts", "Sets"]
        let segmentedControl = UISegmentedControl(items: titles)
        segmentedControl.selectedSegmentIndex = 0
        navigationItem.titleView = segmentedControl
    }
    
    func setupNewWorkoutButton() {
        let newWorkoutButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(newWorkoutTapped))
        newWorkoutButton.tintColor = .orange
        navigationItem.rightBarButtonItem = newWorkoutButton
    }
    
    @objc func newWorkoutTapped() {
        
    }
}

// tableView
extension WorkoutsVC {
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
