//
//  WorkoutsVC.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 20/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutsVC: UIViewController {
    let sections = UISegmentedControl()
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
    func setupNewWorkoutButton() {
        let newWorkoutButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(newWorkoutTapped))
        navigationItem.rightBarButtonItem = newWorkoutButton
    }
    
    @objc func newWorkoutTapped() {
        
    }
}

// sections
extension WorkoutsVC {
    func setupSections() {
        let sections = UISegmentedControl()
        view.addSubview(sections)
//        sections.addTarget(self, action: "action:", for: .valueChanged)
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
