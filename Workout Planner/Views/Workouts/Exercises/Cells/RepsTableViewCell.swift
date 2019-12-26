//
//  RepsTableViewCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class RepsTableViewCell: UITableViewCell {
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 15
        
        return stack
    }()
    var textFields = [UITextField]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        addTextField(with: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
    private func createTextField(of index: Int) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "\(index) set"
        
        return textField
    }
    
    func addTextField(with count: Int) {
        let textField = createTextField(of: count)
        stack.addArrangedSubview(textField)
        textFields.append(textField)
    }
    
    func removeTextField() {
        guard let lastTextField = textFields.last else { return }
        
        textFields.removeLast()
        lastTextField.removeFromSuperview()
    }
}
