//
//  Coordinator.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

protocol Coordinator {
    var presentationController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
