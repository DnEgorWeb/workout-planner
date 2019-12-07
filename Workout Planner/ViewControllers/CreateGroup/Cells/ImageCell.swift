//
//  CreateCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 27/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    var imageName: String? {
        didSet {
            groupImageView.image = UIImage(named: imageName!)
        }
    }
    
    let groupImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "photoPlaceholder")
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func addSubviews() {
        backgroundColor = #colorLiteral(red: 0.3272230029, green: 0.7569765449, blue: 0.9854061007, alpha: 1)
        
        addImageView()
    }
    
    func addImageView() {
        addSubview(groupImageView)
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        
        groupImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        groupImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        groupImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
