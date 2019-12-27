//
//  MainTableViewCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 14/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    weak var delegate: CreateExerciseVC?
    
    let exerciseImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "strength-4") // different for strength, cardio, stretch and custom
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercise name"
        
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter the name"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    let markLabel: UILabel = {
        let label = UILabel()
        label.text = "The remaining fields are optional and can be set or changed later."
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupImage()
        setupLabel()
        setupTextField()
        setupMarkLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupImage() {
        exerciseImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(exerciseImage)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        exerciseImage.isUserInteractionEnabled = true
        exerciseImage.addGestureRecognizer(tapRecognizer)
        
        exerciseImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        exerciseImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        exerciseImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        exerciseImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: exerciseImage.trailingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupTextField() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameTextField)
        
        nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        nameTextField.delegate = self
    }
    
    func setupMarkLabel() {
        markLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(markLabel)
        
        markLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        markLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        markLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        markLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    @objc func imageTapped() {
        delegate?.chooseImage()
    }
}

extension MainTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
