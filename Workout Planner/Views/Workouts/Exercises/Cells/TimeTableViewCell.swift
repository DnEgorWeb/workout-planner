//
//  TimeTableViewCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 9999
        stepper.stepValue = 1
        stepper.value = 1
        
        return stepper
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupTimeLabel()
        setupStepper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTimeLabel() {
        addSubview(timeLabel)
        timeLabel.text = "Time: \(Int(stepper.value))"
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupStepper() {
        addSubview(stepper)
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stepper.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc func stepperChanged() {
        timeLabel.text = "Time: \(Int(stepper.value))"
    }
}
