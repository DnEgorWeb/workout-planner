//
//  CellControllerFactory.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class MyCellControllerFactory {
    func registerCells(on tableView: UITableView) {
        MainTableCellController.registerCell(on: tableView)
        SetsTableCellController.registerCell(on: tableView)
        RepsTableCellController.registerCell(on: tableView)
        TimeTableCellController.registerCell(on: tableView)
        DescriptionTableCellController.registerCell(on: tableView)
    }
    
    func cellControllers(with items: [CellItem]) -> [TableCellController] {
        return items.map { item in
            
            if item.isMainCell {
                return MainTableCellController()
            } else if item.isSetsCell {
                return SetsTableCellController()
            } else if item.isRepsCell {
                return RepsTableCellController()
            } else if item.isTimeCell {
                return TimeTableCellController()
            } else {
                return DescriptionTableCellController()
            }
        }
    }
    
}
