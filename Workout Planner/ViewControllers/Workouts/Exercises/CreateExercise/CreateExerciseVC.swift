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
    let cellControllerFactory = CellControllerFactory()
    
    private var dataSource = CreateExerciseDS()
    private var delegate = CreateExerciseDelegate()
    
    override func loadView() {
        createExerciseView = CreateExercise(frame: .zero, type: type)
        view = createExerciseView
        navigationItem.title = "Create exercise"
        
        cellControllerFactory.registerCells(on: createExerciseView.tableView)
        dataSource.cellControllers = cellControllerFactory.cellControllers(with: type)
        createExerciseView.tableView.dataSource = dataSource
        createExerciseView.tableView.delegate = delegate
    }
}
