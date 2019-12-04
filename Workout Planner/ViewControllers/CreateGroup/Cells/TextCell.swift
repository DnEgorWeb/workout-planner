//
//  TitleCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 27/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {
    private var safeArea: UILayoutGuide!
    
    var titleName: String? {
        didSet {
            titleLabel.text = titleName
        }
    }
    
    var descriptionName: String? {
        didSet {
            titleTextField.placeholder = descriptionName
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        safeArea = self.layoutMarginsGuide
        
        addTitleLabel()
        addTitleTextField()
    }
    
    func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    func addTitleTextField() {
        addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.delegate = self
        
        titleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        titleTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
}

extension TextCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
