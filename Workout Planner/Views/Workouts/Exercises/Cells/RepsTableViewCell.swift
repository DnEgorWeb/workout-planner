//
//  RepsTableViewCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class RepsTableViewCell: UITableViewCell {
    var count: Int?
    let values = [String]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupTextFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextFields() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 15
        addSubview(stack)
        
        stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        let numberOfField = count ?? 1
        for index in 0..<numberOfField {
            let textField = createTextField(of: index)
            stack.addArrangedSubview(textField)
        }
    }
    
    func createTextField(of index: Int) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "\(index + 1) set"
        
        return textField
    }
}
