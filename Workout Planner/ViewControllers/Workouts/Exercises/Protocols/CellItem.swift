//
//  CellItem.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 14/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import Foundation

protocol CellItem {
    var isMainCell: Bool { get }
    var isSetsCell: Bool { get }
    var isRepsCell: Bool { get }
    var isTimeCell: Bool { get }
    var isDescriptionCell: Bool { get }
}
