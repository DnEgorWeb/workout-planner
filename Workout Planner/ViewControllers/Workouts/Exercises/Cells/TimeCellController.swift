//
//  TimeCellController.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class TimeTableCellController: TableCellController {
    let item: CellItem
    
    init(item: CellItem) {
        self.item = item
    }
    
    static var cellIdentifier: String {
        return String(describing: type(of: TimeTableViewCell.self))
    }
    
    static func registerCell(on tableView: UITableView) {
        tableView.register(TimeTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath) as! TimeTableViewCell
        
        // Configure main cell...
        
        return cell
    }
    
    func didSelectCell() {
        // do something
    }
    
    
}
