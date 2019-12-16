//
//  ExercisesDS.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class ExercisesDS: NSObject, UITableViewDataSource {
    var cellControllers = [TableCellController]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellControllers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellControllers[indexPath.row].cellFromTableView(tableView, forIndexPath: indexPath)
    }
}
