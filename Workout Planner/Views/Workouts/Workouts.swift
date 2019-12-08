//
//  Workouts.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class Workouts: UIView {
    let tableView = UITableView()
    let workoutModes = UISegmentedControl(items: ["My workouts", "Exercises", "Programs"])
    private var safeArea: UILayoutGuide!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
        setupSections()
        setupTableView()
    }
    
    func setupSections() {
        workoutModes.selectedSegmentIndex = 0
        if #available(iOS 13, *) {} else {
            workoutModes.tintColor = #colorLiteral(red: 0.3254901961, green: 0.7568627451, blue: 0.9843137255, alpha: 1)
        }
    }
    
    func setupTableView() {
        safeArea = self.layoutMarginsGuide
        tableView.tableFooterView = UIView()
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
