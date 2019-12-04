//
//  ObjectTableViewDelegate.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutsTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        header.backgroundColor = #colorLiteral(red: 0.3272230029, green: 0.7569765449, blue: 0.9854061007, alpha: 1)
        let border = UIView()
        border.backgroundColor = UIColor(named: "black")
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: header.frame.size.height - 3, width: header.frame.size.width, height: 3)
        header.addSubview(border)
        
        let label = UILabel()
        label.text = GroupTypes.allCases[section].rawValue
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        
        header.addSubview(label)
        
        let collapse = UIImageView()
        collapse.image = UIImage(named: "downArrow")
        
        header.addSubview(collapse)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 10).isActive = true
        
        collapse.translatesAutoresizingMaskIntoConstraints = false
        collapse.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        collapse.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -10).isActive = true
        collapse.widthAnchor.constraint(equalToConstant: 15).isActive = true
        collapse.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
