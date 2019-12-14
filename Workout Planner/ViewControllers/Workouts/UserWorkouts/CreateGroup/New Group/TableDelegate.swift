//
//  CreateGroupTableDelegate.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 27/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class CreateGroupTableDelegate: NSObject, UITableViewDelegate {
    weak var delegate: PickerHandler?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 3:
            return 200
        default:
            return 75
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            delegate?.presentPicker()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
