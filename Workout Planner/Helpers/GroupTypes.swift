//
//  groupTypes.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 23/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import Foundation

enum GroupTypes: String, CaseIterable {
    case strength = "Strength"
    case cardio = "Cardio"
    case custom = "Custom"
}

enum ModeTypes {
    case create
    case edit
}
