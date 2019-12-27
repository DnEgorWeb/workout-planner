//
//  TableCellController.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 14/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//
import UIKit

protocol TableCellController {
    static func registerCell(on tableView: UITableView)
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath, sourceController: CreateExerciseVC) -> UITableViewCell
    func didSelectCell()
}
