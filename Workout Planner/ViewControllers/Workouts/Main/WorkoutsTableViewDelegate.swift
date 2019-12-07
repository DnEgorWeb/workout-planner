//
//  ObjectTableViewDelegate.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutsTableViewDelegate: NSObject, UITableViewDelegate {
    weak var delegate: ActionsHandler?
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(
                                   withIdentifier: SectionHeaderView.reuseIdentifier)
                                   as? SectionHeaderView else { return nil }
        
        view.tag = section
        view.label.text = GroupTypes.allCases[section].rawValue
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tap)
                
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, completionHandler) in
            self.delegate?.editCell(indexPath: indexPath, completionHandler: completionHandler)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            self.delegate?.deleteCell(indexPath: indexPath, completionHandler: completionHandler)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let section = sender.view?.tag else { return }
        delegate?.collapse(section: section)
    }
}
