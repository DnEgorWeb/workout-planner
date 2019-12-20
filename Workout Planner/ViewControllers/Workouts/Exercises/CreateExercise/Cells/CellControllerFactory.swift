//
//  CellControllerFactory.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class CellControllerFactory {
    func registerCells(on tableView: UITableView) {
        MainTableCellController.registerCell(on: tableView)
        SetsTableCellController.registerCell(on: tableView)
        RepsTableCellController.registerCell(on: tableView)
        TimeTableCellController.registerCell(on: tableView)
        DescriptionTableCellController.registerCell(on: tableView)
    }
    
    func cellControllers(with group: GroupTypes) -> [TableCellController] {
        switch group {
        case .strength:
            return [MainTableCellController(), SetsTableCellController(), RepsTableCellController()]
        case .cardio:
            return [MainTableCellController(), SetsTableCellController(), TimeTableCellController()]
        case .stretch:
            return [MainTableCellController(), TimeTableCellController(), DescriptionTableCellController()]
        case .custom:
            return [MainTableCellController(), DescriptionTableCellController()]
        }
    }
}
