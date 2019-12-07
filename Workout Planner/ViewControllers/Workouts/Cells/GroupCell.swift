//
//  GroupCell.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 22/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    // MARK - properties
    var currentWorkout: Group? {
        didSet {
            title.text = currentWorkout?.title
            subTitle.text = currentWorkout?.subtitle
            let image = currentWorkout?.image ?? UIImage(named: "emptyGroup")
            groupImage.image = image
        }
    }
    
    let title: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 19)
        
        return titleLabel
    }()
    
    let subTitle: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "Custom subtitle and some lorem ipsum text. Than more then better"
        subtitleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        subtitleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 15)
        
        return subtitleLabel
    }()
    
    let groupImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(groupImage)
        addSubview(title)
        addSubview(subTitle)
        
        setupConstraints()
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
}

extension GroupCell {
    func setupConstraints() {
        setupImage()
        setupTitle()
        setupSubtitle()
    }
    
    func setupImage() {
        groupImage.translatesAutoresizingMaskIntoConstraints = false
        groupImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        groupImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        groupImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        groupImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: groupImage.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: groupImage.trailingAnchor, constant: 10).isActive = true
    }
    
    func setupSubtitle() {
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
}
