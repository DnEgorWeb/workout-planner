//
//  ExercisesDS.swift
//  Workout Planner
//
//  Created by Egor Deryabin on 15/12/2562 BE.
//  Copyright © 2562 Egor Deryabin. All rights reserved.
//

import UIKit

class ExercisesDS: NSObject, UITableViewDataSource {
    var exercises: [GroupTypes: [Exercise]] = [.strength: [], .cardio: [], .stretch: [], .custom: []]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = GroupTypes.allCases[section]
        guard let sectionData = exercises[sectionType] else { return 0 }
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.exerciseCell.rawValue) as? ExerciseCell else {
            return UITableViewCell()
        }
        
        let sectionNumber = indexPath.section
        let sectionType = GroupTypes.allCases[sectionNumber]
        let rowNumber = indexPath.row
        let groupExercises = exercises[sectionType]
        let exercise = groupExercises?[rowNumber]

        cell.name = exercise?.name
        cell.cellImage = UIImage(data: (exercise?.image)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionType = GroupTypes.allCases[section]
        
        return sectionType.rawValue
    }
}
