//
//  IconsSets.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 28/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class IconsSets: UIView {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var safeArea: UILayoutGuide!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCollectionView()
    }

    func setupCollectionView() {
        safeArea = self.layoutMarginsGuide
        addSubview(collectionView)

        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
