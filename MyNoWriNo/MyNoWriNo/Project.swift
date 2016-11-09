//
//  Project.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/5/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

// class for all projects.
class Project: NSObject {
    
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
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        targetWordCount = aDecoder.decodeObject(forKey: "targetWordCount") as! Int
        deadline = aDecoder.decodeObject(forKey: "deadline") as! Date
        cumulativeWordCount = aDecoder.decodeObject(forKey: "cumulativeWordCount") as! Int
        percentComplete = aDecoder.decodeObject(forKey: "percentComplete") as! Int
        currentDate = aDecoder.decodeObject(forKey: "currentDate") as! Date
        wordsRemaining = aDecoder.decodeObject(forKey: "wordsRemaining") as! Int
        daysRemaining = aDecoder.decodeObject(forKey: "daysRemaining") as! Int
        dailyWordCount = aDecoder.decodeObject(forKey: "dailyWordCount") as! [Date: Int]?
        genre = aDecoder.decodeObject(forKey: "genre") as! String?
        wordsPerDayForTarget = aDecoder.decodeObject(forKey: "wordsPerDayForTarget") as! Int?
    }
    
    func getDaysRemaining(currentDate: Date, deadline: Date) {
        let interval = DateInterval(start: self.currentDate, end: self.deadline).duration / 86400
        self.daysRemaining = Int(interval.rounded())
    }
    
    func getReadableDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "en_US")
        let dateAsString = formatter.string(from: date)
        return dateAsString
    }
}

extension Project: NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name") as! String
        aCoder.encode(targetWordCount, forKey: "targetWordCount") as! Int
        aCoder.encode(deadline, forKey: "deadline") as! Date
        aCoder.encode(cumulativeWordCount, forKey: "cumulativeWordCount") as! Int
        aCoder.encode(percentComplete, forKey: "percentComplete") as! Int
        aCoder.encode(currentDate, forKey: "currentDate") as! Date
        aCoder.encode(wordsRemaining, forKey: "wordsRemaining") as! Int
        aCoder.encode(daysRemaining, forKey: "daysRemaining") as! Int
        aCoder.encode(dailyWordCount, forKey: "dailyWordCount") as! [Date: Int]
        aCoder.encode(genre, forKey: "genre") as! String
        aCoder.encode(wordsPerDayForTarget, forKey: "wordsPerDayForTarget") as! Int
    }
}
