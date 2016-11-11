//
//  Projects.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/10/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class Projects {
    
    static let shared = Projects()
    
    var defaults = UserDefaults.standard
    
    var allProjects = [Project]() {
        didSet {
            saveProjectData()
            
        }
    }

    func saveProjectData() {
        let savedData = NSKeyedArchiver.archivedData(withRootObject: self.allProjects)
        self.defaults.set(savedData, forKey: "projects")
        self.defaults.synchronize()
    }
    
}
