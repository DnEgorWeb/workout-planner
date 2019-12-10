//
//  WorkoutsVC.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 20/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit
import RealmSwift

class WorkoutsVC: UIViewController {
    weak var coordinator: WorkoutCoordinator?
    private var workoutsView = Workouts()
    private var dataSource = WorkoutsDS()
    private var tableDelegate = WorkoutsTableViewDelegate()
    private let cellIdentifier = CellIdentifiers.workouts.rawValue

    override func loadView() {
        super.loadView()
        
        getData()
        
        workoutsView.tableView.register(GroupCell.self, forCellReuseIdentifier: cellIdentifier)
        workoutsView.tableView.dataSource = dataSource
        workoutsView.tableView.delegate = tableDelegate
        workoutsView.tableView.register(SectionHeaderView.self, forHeaderFooterViewReuseIdentifier: SectionHeaderView.reuseIdentifier)
        workoutsView.tableView.allowsSelectionDuringEditing = true
        
        tableDelegate.delegate = self
        
        setupSections()
        setupNewGroupButton()
        
        view = workoutsView
    }
    
    func getData() {
        let realm = try! Realm()
        let groups = realm.objects(Group.self)
        for group in groups {
            dataSource.workoutsData[group.type]?.append(group)
        }
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
    
    func modifyGroup(group: Group, indexPath: IndexPath) {
        guard let cell = workoutsView.tableView.cellForRow(at: indexPath) as? GroupCell else { return }
        guard let oldGroup = dataSource.workoutsData[cell.type!]?[indexPath.row] else { return }
        
        StorageManager.updateObject(oldGroup: oldGroup, newGroup: group)
        
        if cell.type != group.type {
            dataSource.workoutsData[cell.type!]?.remove(at: indexPath.row)
            createGroup(newGroup: group)
            return
        } else {
            dataSource.workoutsData[group.type]?[indexPath.row] = group
        }

        let view = self.view as? Workouts
        view?.tableView.reloadData()
    }
    
    func createGroup(newGroup: Group) {
        dataSource.workoutsData[newGroup.type]?.append(newGroup)
        let view = self.view as? Workouts
        view?.tableView.reloadData()
    }
}

// MARK: - Selectors
extension WorkoutsVC {
    @objc func newGroupTapped() {
        coordinator?.createNewGroup(mode: .create, groupData: nil, indexPath: nil)
    }
    
    @objc func segmentedControlTapped(sender: UISegmentedControl) {
        navigationItem.rightBarButtonItem?.isEnabled = sender.selectedSegmentIndex != 2
    }
}

extension WorkoutsVC: ActionsHandler {
    func collapse(section: Int) {
        let sectionType = GroupTypes.allCases[section]
        dataSource.collapseSectionsState[sectionType]?.toggle()
        let view = self.view as? Workouts
        
        view?.tableView.beginUpdates()
        view?.tableView.reloadSections([section], with: .fade)
        view?.tableView.endUpdates()
    }
    
    func editCell(indexPath: IndexPath, completionHandler: @escaping (Bool) -> Void) {
        let sectionType = GroupTypes.allCases[indexPath.section]
        let groupData = self.dataSource.workoutsData[sectionType]?[indexPath.row]
        self.coordinator?.createNewGroup(mode: .edit, groupData: groupData, indexPath: indexPath)
        completionHandler(true)
    }
    
    func deleteCell(indexPath: IndexPath, completionHandler: @escaping (Bool) -> Void) {
        let message = "Please, confirm you want to delete this group"
        let ac = UIAlertController(title: "Delete group", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            let sectionType = GroupTypes.allCases[indexPath.section]
            guard let section = self.dataSource.workoutsData[sectionType] else {
                completionHandler(false)
                return
            }

            self.dataSource.workoutsData[sectionType]?.remove(at: indexPath.row)
            self.workoutsView.tableView.deleteRows(at: [indexPath], with: .fade)
            StorageManager.deleteObject(section[indexPath.row])
            
            completionHandler(true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            completionHandler(false)
            self.workoutsView.tableView.reloadData()
        }
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        self.present(ac, animated: true)
    }
}
