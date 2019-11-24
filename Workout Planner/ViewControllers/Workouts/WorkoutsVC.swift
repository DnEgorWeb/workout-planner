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
    private var defaultData: [GroupTypes: [Group]] = [
        .srength: [
            Group(title: "Monday", subtitle: "Hands and chest", imageName: nil),
            Group(title: "Friday", subtitle: "Legs and ABS", imageName: nil),
        ],
        .cardio: [
            Group(title: "Tabata", subtitle: "Legs", imageName: nil),
        ],
        .custom: [
            Group(title: "Group title", subtitle: "Group subtitle", imageName: nil),
        ]
    ]
    private let groupCell = "groupCell"

    override func loadView() {
        super.loadView()
        
        
        setupHeader()
        setupTableView()
    }
    
    // MARK: - Setup
    func setupTableView() {
        safeArea = view.layoutMarginsGuide
        tableView.register(GroupCell.self, forCellReuseIdentifier: groupCell)
        tableView.delegate = self
        tableView.dataSource = self
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

// MARK: - Data source and delegate
extension WorkoutsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return defaultData.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        header.backgroundColor = #colorLiteral(red: 0.3272230029, green: 0.7569765449, blue: 0.9854061007, alpha: 1)
        let border = UIView()
        border.backgroundColor = UIColor(named: "black")
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: header.frame.size.height - 3, width: header.frame.size.width, height: 3)
        header.addSubview(border)
        
        let label = UILabel()
        label.text = GroupTypes.allCases[section].rawValue
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        
        header.addSubview(label)
        
        let collapse = UIImageView()
        collapse.image = UIImage(named: "downArrow")
        
        header.addSubview(collapse)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 10).isActive = true
        
        collapse.translatesAutoresizingMaskIntoConstraints = false
        collapse.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        collapse.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -10).isActive = true
        collapse.widthAnchor.constraint(equalToConstant: 15).isActive = true
        collapse.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = GroupTypes.allCases[section]
        guard let sectionData = defaultData[sectionType] else { return 0 }
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCell, for: indexPath) as! GroupCell
        let sectionNumber = indexPath.section
        let sectionType = GroupTypes.allCases[sectionNumber]
        let rowNumber = indexPath.row
        let currentGroup = defaultData[sectionType]
        let currentWorkout = currentGroup?[rowNumber]
        cell.currentWorkout = currentWorkout
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
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
