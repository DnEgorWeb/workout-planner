//
//  ExerciseCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 19/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let nameLabel = UILabel()
    
    var name: String! {
        didSet {
            nameLabel.text = name
        }
    }
    var cellImage: UIImage! {
        didSet {
            cellImageView.image = cellImage
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupImageView()
        setupNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
