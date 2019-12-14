//
//  CollapseHandler.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 6/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

protocol ActionsHandler: class {
    func collapse(section: Int)
    
    func deleteCell(indexPath: IndexPath, completionHandler: @escaping (Bool) -> Void)
    
    func editCell(indexPath: IndexPath, completionHandler: @escaping (Bool) -> Void)
}
