//
//  File.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 16/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit
import RealmSwift

class Exercise: Object {
    @objc dynamic var name: String!
    @objc dynamic var typeRaw: String!
    var type: GroupTypes {
        get {
            return GroupTypes(rawValue: typeRaw ?? GroupTypes.custom.rawValue) ?? GroupTypes.custom
        }
        set { typeRaw = newValue.rawValue }
    }
    @objc dynamic var image: Data!
    
    convenience init(name: String, type: GroupTypes, image: UIImage) {
        self.init()
        
        self.name = name
        self.typeRaw = type.rawValue
        self.type = type
        self.image = image.pngData()
    }
}
