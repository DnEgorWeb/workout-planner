//
//  ObjectDataSource.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class ObjectDataSource: NSObject, UITableViewDataSource {
    private var defaultData: [GroupTypes: [Group]] = [
        .srength: [
            Group(title: "Monday", subtitle: "Hands and chest", imageName: nil),
            Group(title: "Friday", subtitle: "Legs and ABS", imageName: nil),
        ],
        .cardio: [
            Group(title: "Tabata", subtitle: "Legs", imageName: nil),
        ],
        .custom: [
            Group(title: "Group title", subtitle: "Group subtitle", imageName: nil),
        ]
    ]
    private let groupCell = "groupCell"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return defaultData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = GroupTypes.allCases[section]
        guard let sectionData = defaultData[sectionType] else { return 0 }
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCell, for: indexPath) as! GroupCell
        let sectionNumber = indexPath.section
        let sectionType = GroupTypes.allCases[sectionNumber]
        let rowNumber = indexPath.row
        let currentGroup = defaultData[sectionType]
        let currentWorkout = currentGroup?[rowNumber]
        cell.currentWorkout = currentWorkout
        return cell
    }
}
