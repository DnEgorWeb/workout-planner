//
//  StrengthExercise.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 13/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import Foundation
import RealmSwift

class StrengthExercise: Object, Exercise {
    var type: GroupTypes {
        get {
            return GroupTypes.strength
        }
    }
    var title: String = ""
    var image: Data?
    var reps: Int = 0
    var sets: Int = 0
    var weights: [Float] = []
    
    convenience required init(title: String, image: UIImage?, reps: Int, sets: Int, weights: [Float]) {
        self.init()
        
        self.title = title
        self.image = image?.pngData()
        self.reps = reps
        self.sets = sets
        self.weights = weights
    }
}
