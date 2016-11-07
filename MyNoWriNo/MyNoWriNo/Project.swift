//
//  Project.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/5/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

// class for all projects.
class Project {
    
    let name: String
    let targetWordCount: Int
    var cumulativeWordCount: Int = 0
    var percentComplete: Int = 0
    let deadline: Date
    var currentDate: Date
    
    var dailyWordCount: [Date: Int]?
    var genre: String?
    
    var daysRemaining: TimeInterval? // make a function that subtracts the current date from deadline
    var wordsRemaining: Int?
    var wordsPerDayForTarget: Int?
    
    init(name: String, targetWordCount: Int, cumulativeWordCount: Int, percentComplete: Int, deadline: Date, currentDate: Date) {
        self.name = name
        self.targetWordCount = targetWordCount
        self.cumulativeWordCount = cumulativeWordCount
        self.percentComplete = percentComplete
        self.deadline = deadline
        self.currentDate = currentDate // make a function that gets the current date
        self.wordsRemaining = self.targetWordCount - self.cumulativeWordCount
        
    }

}
