//
//  CreateGroupVC.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 21/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {
    weak var coordinator: WorkoutCoordinator?
    private let tableView = UITableView()
    private var safeArea: UILayoutGuide!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
    }
    
    // MARK: - Properties
    
    
    // MARK: - IBOutlets
    
    
    // MARK: - Life cycle
    
    
    // MARK: - Set up
    
    
    // MARK: - IBActions
    
    
    // MARK: - Navigation
    
    
    // MARK: - Network Manager calls
    
    
    // MARK: - Extensions
    
}
