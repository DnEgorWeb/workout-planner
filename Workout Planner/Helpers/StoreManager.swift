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
}
