//
//  CreateGroupVC.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 21/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {
    // MARK: - Properties
    weak var coordinator: WorkoutCoordinator?
    private var dataSource = CreateGroupDS()
    private var tableDelegate = CreateGroupTableDelegate()
    
    private let imageCellIdentifier = CellIdentifiers.createGroupImage.rawValue
    private let titleCellIdentifier = CellIdentifiers.createGroupTitle.rawValue
    private let subtitleCellIdentifier = CellIdentifiers.createGroupSubtitle.rawValue
    private let typeCellIdentifier = CellIdentifiers.createGroupType.rawValue
    
    override func loadView() {
        super.loadView()

        let createGroup = CreateGroup(frame: self.view.frame)
        tableDelegate.presentationController = self
        dataSource.presentationController = self
        
        createGroup.tableView.register(ImageCell.self, forCellReuseIdentifier: imageCellIdentifier)
        createGroup.tableView.register(TextCell.self, forCellReuseIdentifier: titleCellIdentifier)
        createGroup.tableView.register(TypeCell.self, forCellReuseIdentifier: typeCellIdentifier)
        
        createGroup.tableView.dataSource = dataSource
        createGroup.tableView.delegate = tableDelegate
        createGroup.imagePicker.delegate = self
        
        view = createGroup
    }
}

extension CreateGroupVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let createGroupView = view as? CreateGroup else { return }
        guard let cell = createGroupView.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImageCell else { return }
        cell.groupImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
}
