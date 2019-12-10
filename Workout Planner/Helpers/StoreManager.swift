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
}
