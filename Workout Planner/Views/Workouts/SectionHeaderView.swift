//
//  SectionHeaderView.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 6/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

final class SectionHeaderView: UITableViewHeaderFooterView {
    static let reuseIdentifier: String = String(describing: self)
    
    let label = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let border = UIView()
        border.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.7568627451, blue: 0.9843137255, alpha: 1)
        
        contentView.addSubview(border)
        contentView.addSubview(label)
        
        border.translatesAutoresizingMaskIntoConstraints = false
        border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        border.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        border.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
