//
//  TypeCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 27/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class TypeCell: UITableViewCell {
    private var safeArea: UILayoutGuide!
    
    var titleName: String? {
        didSet {
            titleLabel.text = titleName
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let picker: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func addSubviews() {
        safeArea = self.layoutMarginsGuide
        
        addTitleLabel()
        addPicker()
    }
    
    func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    func addPicker() {
        addSubview(picker)
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        picker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        picker.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}

extension TypeCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Strength"
        case 1:
            return "Cardio"
        default:
            return "Custom"
        }
    }
}
