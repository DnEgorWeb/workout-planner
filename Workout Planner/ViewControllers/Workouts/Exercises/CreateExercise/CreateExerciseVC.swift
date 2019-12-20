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
    var type: GroupTypes!
    
    override func loadView() {
        view = CreateExercise(frame: .zero, type: type)
        
        navigationItem.title = "Create exercise"
    }
}
