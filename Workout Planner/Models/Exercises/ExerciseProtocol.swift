//
//  ExerciseProtocol.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 13/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import Foundation
import RealmSwift

protocol Exercise: Object {
    var title: String { get set }
    var image: Data? { get set }
    var type: GroupTypes { get }
}
