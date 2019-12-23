//
//  SetsTableViewCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class SetsTableViewCell: UITableViewCell {
    var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 99
        stepper.stepValue = 1
        stepper.value = 1
        
        return stepper
    }()
    
    var setsLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSetsLabel()
        setupStepper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSetsLabel() {
        addSubview(setsLabel)
        setsLabel.text = "Sets: \(Int(stepper.value))"
        
        setsLabel.translatesAutoresizingMaskIntoConstraints = false
        setsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        setsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupStepper() {
        addSubview(stepper)
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stepper.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc func stepperChanged() {
        setsLabel.text = "Sets: \(Int(stepper.value))"
        
        NotificationCenter.default.post(name: .countOfSetsChanged, object: stepper.value)
    }
}
