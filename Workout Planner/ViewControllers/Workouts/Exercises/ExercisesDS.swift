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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") else {
            return UITableViewCell()
        }
        
        return cell
    }
}
