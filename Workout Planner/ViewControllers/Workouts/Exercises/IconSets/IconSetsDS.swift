//
//  IconSetsDS.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 28/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class IconSetsDS: NSObject, UICollectionViewDataSource {
    var type: GroupTypes!
    
    func getNumberOfCellsByType() -> Int {
        switch (type) {
        case .strength:
            return 27
        case .cardio:
            return 13
        case .stretch:
            return 100
        case .custom:
            return 0
        default:
            return 0
        }
    }
    
    func getPrefix() -> String {
        
        if type == GroupTypes.stretch {
            return "yoga"
        }
        
        return type.rawValue.lowercased()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {        
        return getNumberOfCellsByType()
    }
            
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCell.identifier, for: indexPath) as! IconCell
        
        let row = indexPath.row
        let prefix = getPrefix()
        
        cell.iconImageView.image = UIImage(named: "\(prefix)-\(row)")
        
        return cell
    }
    
    
}
