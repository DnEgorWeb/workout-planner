//
//  StoreManager.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 10/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ group: Group) {
        try! realm.write {
            realm.add(group)
        }
    }
    
    static func updateObject(oldGroup: Group, newGroup: Group) {
        try! realm.write {
            
            oldGroup.title = newGroup.title
            oldGroup.subtitle = newGroup.subtitle
            oldGroup.image = newGroup.image
            oldGroup.type = newGroup.type
        }
    }
    
    static func deleteObject(_ group: Group) {
        try! realm.write {
            realm.delete(group)
        }
    }
    
    static func setDefaultGroups() {
        let workoutsData: [Group] = [
            Group(title: "Monday", subtitle: "Hands and chest", image: #imageLiteral(resourceName: "emptyGroup"), type: .strength),
            Group(title: "Friday", subtitle: "Legs and ABS", image: #imageLiteral(resourceName: "emptyGroup"), type: .strength),
            Group(title: "Tabata", subtitle: "Legs", image: #imageLiteral(resourceName: "emptyGroup"), type: .cardio),
            Group(title: "Group title", subtitle: "Group subtitle", image: #imageLiteral(resourceName: "emptyGroup"), type: .custom),
        ]

        let realm = try! Realm()
        try! realm.write {
            for group in workoutsData {
                realm.add(group)
            }
        }
    }
    
    static func setDefaultExercises() {
        let exercises: [Exercise] = [
            Exercise(name: "Bench press", type: .strength, image: #imageLiteral(resourceName: "strength-1")),
            Exercise(name: "Incline bench press", type: .strength, image: #imageLiteral(resourceName: "strength-1")),
            Exercise(name: "Pullup", type: .strength, image: #imageLiteral(resourceName: "strength-7")),
            Exercise(name: "Dip", type: .strength, image: #imageLiteral(resourceName: "strength-14")),
            Exercise(name: "ABS", type: .strength, image: #imageLiteral(resourceName: "strength-22")),
            
            Exercise(name: "Run", type: .strength, image: #imageLiteral(resourceName: "cardio-0")),
            Exercise(name: "Jump rope", type: .strength, image: #imageLiteral(resourceName: "cardio-1")),
            Exercise(name: "Cycling", type: .strength, image: #imageLiteral(resourceName: "cardio-12")),
            Exercise(name: "Boxing", type: .strength, image: #imageLiteral(resourceName: "cardio-3")),
            
            Exercise(name: "Standing Hamstring", type: .strength, image: #imageLiteral(resourceName: "yoga-68")),
            Exercise(name: "Butterfly", type: .strength, image: #imageLiteral(resourceName: "yoga-10")),
            Exercise(name: "Lying Quad", type: .strength, image: #imageLiteral(resourceName: "yoga-40")),
            Exercise(name: "Puppy Pose", type: .strength, image: #imageLiteral(resourceName: "yoga-50")),
            Exercise(name: "Puppy Pose", type: .strength, image: #imageLiteral(resourceName: "yoga-31")),
        ]
        
        let realm = try! Realm()
        try! realm.write {
            for exercise in exercises {
                realm.add(exercise)
            }
        }
    }
}
