//
//  MainTableCellController.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 14/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class MainTableCellController: TableCellController {
    fileprivate let item: CellItem
    
    init(item: CellItem) {
        self.item = item
    }
    
    fileprivate static var cellIdentifier: String {
        return String(describing: type(of: MainTableViewCell.self))
    }
    
    static func registerCell(on tableView: UITableView) {
        tableView.register(UINib(nibName: cellIdentifier, bundle: Bundle(for: MainTableViewCell.self)), forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath) as! MainTableViewCell
        
        // Configure main cell...
        
        return cell
    }
    
    func didSelectCell() {
        // do something
    }
    
    
}
