//
//  CreateExerciseVC.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 20/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class CreateExerciseVC: UIViewController {
    weak var coordinator: WorkoutCoordinator!
    var createExerciseView: CreateExercise!
    var type: GroupTypes!
    private let cellControllerFactory = CellControllerFactory()
    private var dataSource = CreateExerciseDS()
    private var delegate = CreateExerciseDelegate()
    
    override func loadView() {
        createExerciseView = CreateExercise(frame: .zero)
        view = createExerciseView
        navigationItem.title = "Create exercise"
        
        cellControllerFactory.registerCells(on: createExerciseView.tableView)
        dataSource.cellControllers = cellControllerFactory.cellControllers(with: type)
        createExerciseView.tableView.dataSource = dataSource
        createExerciseView.tableView.delegate = delegate
        
        if (type == .strength) {
            NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .countOfSetsChanged, object: nil)
        }
    }
    
    @objc func onDidReceiveData(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let stepperData = userInfo["stepperData"] as? Stepper else { return }
        guard let cell = createExerciseView.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? RepsTableViewCell else { return }
        
        let oldValue = stepperData.oldValue
        let newValue = stepperData.newValue
        
        if (newValue > oldValue) {
            cell.addTextField(with: newValue)
        } else {
            cell.removeTextField()
        }
        
        createExerciseView.tableView.reloadData()
    }
}
