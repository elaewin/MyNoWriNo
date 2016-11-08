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
    let deadline: Date
    
    var cumulativeWordCount: Int = 0
    var percentComplete: Int = 0
    var currentDate: Date
    var wordsRemaining: Int
    var daysRemaining: Int
    
    var dailyWordCount: [Date: Int]?
    var genre: String?
    
    var wordsPerDayForTarget: Int?
    
    init(name: String, targetWordCount: Int, deadline: Date) {
        self.name = name
        self.targetWordCount = targetWordCount
        self.deadline = deadline // how to get this date?
        self.currentDate = Date()
        self.wordsRemaining = self.targetWordCount - self.cumulativeWordCount
        
        if !(self.currentDate > self.deadline) {
            let interval = (DateInterval(start: self.currentDate, end: self.deadline)).duration / 86400
            self.daysRemaining = Int(interval.rounded())
        } else {
            self.daysRemaining = 0
        }
        
        self.wordsPerDayForTarget = self.wordsRemaining / self.daysRemaining
    }
    
    func getDaysRemaining(currentDate: Date, deadline: Date) {
        let interval = DateInterval(start: self.currentDate, end: self.deadline).duration / 86400
        self.daysRemaining = Int(interval.rounded())
    }
    
    
}
