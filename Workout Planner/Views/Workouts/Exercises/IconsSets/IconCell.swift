//
//  IconCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 28/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class IconCell: UICollectionViewCell {
    static var identifier: String = "IconCell"
    let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
