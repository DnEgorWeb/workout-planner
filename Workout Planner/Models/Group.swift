//
//  Group.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 22/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit
import RealmSwift

class Group: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var subtitle: String?
    @objc dynamic var image: Data?
    private dynamic var typeRaw: String = GroupTypes.custom.rawValue
    var type: GroupTypes {
        get { return GroupTypes(rawValue: typeRaw) ?? GroupTypes.custom }
        set { typeRaw = newValue.rawValue }
    }
    
    convenience init(title: String, subtitle: String?, image: UIImage?, type: GroupTypes) {
        self.init()
        
        self.title = title
        self.subtitle = subtitle
        self.image = image?.pngData()
        self.type = type
    }
}
