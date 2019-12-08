//
//  ObjectDataSource.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 27/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class CreateGroupDS: NSObject, UITableViewDataSource {
    weak var delegate: EditingHandler?
    var mode: ModeTypes?
    var groupData: Group?
    private let imageCellIdentifier = CellIdentifiers.createGroupImage.rawValue
    private let titleCellIdentifier = CellIdentifiers.createGroupTitle.rawValue
    private let subtitleCellIdentifier = CellIdentifiers.createGroupSubtitle.rawValue
    private let typeCellIdentifier = CellIdentifiers.createGroupType.rawValue
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: imageCellIdentifier, for: indexPath) as! ImageCell
            
            if (mode == .edit) {
                if let image = groupData?.image {
                    cell.groupImageView.image = image
                    cell.backgroundColor = .none
                }
            }
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCellIdentifier, for: indexPath) as! TextCell
            cell.titleName = "Group name"
            cell.descriptionName = "Body part, week day or anything else"
            cell.titleTextField.addTarget(self, action: #selector(editingChanged(sender:)), for: .editingChanged)
            
            if (mode == .edit) {
                cell.titleTextField.text = groupData?.title
            }
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCellIdentifier, for: indexPath) as! TextCell
            cell.titleName = "Description"
            cell.descriptionName = "Type any additional information you need"
            
            if (mode == .edit) {
                cell.titleTextField.text = groupData?.subtitle
            }
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: typeCellIdentifier, for: indexPath) as! TypeCell
            cell.titleName = "Type"
            
            if (mode == .edit) {
                cell.type = groupData?.type ?? .strength
            }
            
            return cell
        }
    }
    
    @objc func editingChanged(sender: UITextField) {
        delegate?.editingChanged(sender: sender)
    }
}
