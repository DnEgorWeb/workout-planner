//
//  DescriptionTableViewCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description for exercise"
        
        return label
    }()
    
    let descriptionField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "I.g. some caveats or notes"
        
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabel()
        setupField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
    func setupField() {
        addSubview(descriptionField)
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        descriptionField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        descriptionField.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).isActive = true
        descriptionField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
}
