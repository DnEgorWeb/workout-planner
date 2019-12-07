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
    var mode: ModeTypes
    var groupData: Group? {
        didSet {
            dataSource.groupData = groupData
        }
    }
    var indexPath: IndexPath?
    private var tableView: UITableView?
    private var dataSource = CreateGroupDS()
    private var tableDelegate = CreateGroupTableDelegate()
    
    private let imageCellIdentifier = CellIdentifiers.createGroupImage.rawValue
    private let titleCellIdentifier = CellIdentifiers.createGroupTitle.rawValue
    private let subtitleCellIdentifier = CellIdentifiers.createGroupSubtitle.rawValue
    private let typeCellIdentifier = CellIdentifiers.createGroupType.rawValue
    
    init(mode: ModeTypes) {
        self.mode = mode
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        let createGroup = CreateGroup(frame: self.view.frame)
        tableView = createGroup.tableView
        
        tableView?.register(ImageCell.self, forCellReuseIdentifier: imageCellIdentifier)
        tableView?.register(TextCell.self, forCellReuseIdentifier: titleCellIdentifier)
        tableView?.register(TypeCell.self, forCellReuseIdentifier: typeCellIdentifier)
        
        dataSource.mode = mode
        tableView?.dataSource = dataSource
        tableView?.delegate = tableDelegate
        createGroup.imagePicker.delegate = self
        
        view = createGroup
        
        tableDelegate.delegate = self
        dataSource.delegate = self
    }
}

extension CreateGroupVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let cell = tableView?.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImageCell else { return }
        cell.groupImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
}

extension CreateGroupVC: EditingHandler {
    func editingChanged(sender: UITextField) {
        guard let text = sender.text else { return }
        let rightBarButtonItem = self.navigationItem.rightBarButtonItem
        
        rightBarButtonItem?.isEnabled = text.count > 0 ? true : false
    }
}

extension CreateGroupVC: PickerHandler {
    func presentPicker() {
        guard let view = view as? CreateGroup else { return }
        view.endEditing(false)
        let imagePicker = view.imagePicker
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
}
