//
//  ObjectDataSource.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 24/11/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class WorkoutsDS: NSObject, UITableViewDataSource {
    var workoutsData: [GroupTypes: [Group]] = [
        .strength: [
            Group(title: "Monday", subtitle: "Hands and chest", image: #imageLiteral(resourceName: "emptyGroup"), type: .strength),
            Group(title: "Friday", subtitle: "Legs and ABS", image: #imageLiteral(resourceName: "emptyGroup"), type: .strength),
        ],
        .cardio: [
            Group(title: "Tabata", subtitle: "Legs", image: #imageLiteral(resourceName: "emptyGroup"), type: .cardio),
        ],
        .custom: [
            Group(title: "Group title", subtitle: "Group subtitle", image: #imageLiteral(resourceName: "emptyGroup"), type: .custom),
        ]
    ]
    var collapseSectionsState: [GroupTypes: Bool] = [.strength: false, .cardio: false, .custom: false]
    private let groupCell = CellIdentifiers.workouts.rawValue
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workoutsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = GroupTypes.allCases[section]
        if collapseSectionsState[sectionType] == true { return 0 }
        guard let sectionData = workoutsData[sectionType] else { return 0 }
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCell, for: indexPath) as! GroupCell
        let sectionNumber = indexPath.section
        let sectionType = GroupTypes.allCases[sectionNumber]
        let rowNumber = indexPath.row
        let currentGroup = workoutsData[sectionType]
        let currentWorkout = currentGroup?[rowNumber]
        cell.currentWorkout = currentWorkout
        return cell
    }
}
