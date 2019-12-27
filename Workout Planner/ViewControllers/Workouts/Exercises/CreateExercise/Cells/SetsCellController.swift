//
//  SetsCellController.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class SetsTableCellController: TableCellController {
    static var cellIdentifier: String {
        return String(describing: type(of: SetsTableViewCell.self))
    }
    
    static func registerCell(on tableView: UITableView) {
        tableView.register(SetsTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath, sourceController: CreateExerciseVC) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath) as! SetsTableViewCell
        
        // Configure main cell...
        
        return cell
    }
    
    func didSelectCell() {
        // do something
    }
    
    
}
