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
    private let tableView = UITableView()
    private var safeArea: UILayoutGuide!
    private let groupCell = "groupCell"
    var dataSource = ObjectDataSource()
    var tableDelegate = ObjectTableViewDelegate()

    override func loadView() {
        super.loadView()
        
        setupHeader()
        setupTableView()
    }
    
    // MARK: - Setup
    func setupTableView() {
        safeArea = view.layoutMarginsGuide
        tableView.register(GroupCell.self, forCellReuseIdentifier: groupCell)
        tableView.delegate = tableDelegate
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupHeader() {
        navigationController?.navigationBar.tintColor = .orange
        
        setupNewGroupButton()
        setupSections()
    }
    
    func setupSections() {
        let titles = ["My workouts", "Exercises", "Programs"]
        let segmentedControl = UISegmentedControl(items: titles)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped(sender:)), for: .valueChanged)
        navigationItem.titleView = segmentedControl
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
