//
//  StrengthExercise.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 13/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import Foundation
import RealmSwift

class Exercise: Object {
    @objc dynamic var title: String!
    @objc private dynamic var typeRaw: String!
    var type: GroupTypes {
        get {
            return GroupTypes(rawValue: typeRaw ?? GroupTypes.custom.rawValue) ?? GroupTypes.custom
        }
        set { typeRaw = newValue.rawValue }
    }
    @objc dynamic var reps = 0
    @objc dynamic var sets = 0
    @objc dynamic var weights: [Float]? = nil
    @objc dynamic var image: Data? = nil
    @objc dynamic var groupName: String? = nil
    @objc dynamic var time = 0
    @objc dynamic var customDescription: String? = nil
    
    // strength
    required convenience init(title: String, image: UIImage?, reps: Int, sets: Int, weights: [Float]) {
        self.init()
        
        self.title = title
        self.image = image?.pngData()
        self.reps = reps
        self.sets = sets
        self.weights = weights
    }
    
    // cardio
    required convenience init(title: String, image: UIImage?, sets: Int, time: Int) {
        self.init()
        
        self.title = title
        self.image = image?.pngData()
        self.sets = sets
        self.time = time
    }
    
    // stretching
    required convenience init(title: String, image: UIImage?, time: Int, customDescription: String) {
        self.init()
        
        self.title = title
        self.image = image?.pngData()
        self.customDescription = customDescription
        self.time = time
    }
    
    // custom
    required convenience init(title: String, image: UIImage?, customDescription: String) {
        self.init()
        
        self.title = title
        self.image = image?.pngData()
        self.customDescription = customDescription
    }
}
