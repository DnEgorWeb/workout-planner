//
//  RepsCellController.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class RepsTableCellController: TableCellController {
    static var cellIdentifier: String {
        return String(describing: type(of: RepsTableViewCell.self))
    }
    
    static func registerCell(on tableView: UITableView) {
        tableView.register(RepsTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath) as! RepsTableViewCell
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .countOfSetsChanged, object: nil)
        
        return cell
    }
    
    func didSelectCell() {
        // do something
    }
    
    @objc func onDidReceiveData(_ notification: Notification) {
        guard let data = notification.userInfo else { return }
        
    }
}
