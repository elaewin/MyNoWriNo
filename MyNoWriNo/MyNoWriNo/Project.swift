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
    var startDate: Date
    var wordsRemaining: Int
    var daysElapsed: Int
    var daysRemaining: Int
    var daysOfWriting: Int
    
    var dailyWordCount: [WordsTuple] = []
    var genre: String?
    
    var wordsPerDayForTarget: Int?
    
    init(name: String, targetWordCount: Int, deadline: Date) {
        self.name = name
        self.targetWordCount = targetWordCount
        self.deadline = deadline // how to get this date?
        self.startDate = Date()
        self.wordsRemaining = self.targetWordCount - self.cumulativeWordCount
        
        if !(self.startDate > self.deadline) {
            let currentDate = Date()
            let interval = (DateInterval(start: currentDate, end: self.deadline)).duration / 86400
            self.daysRemaining = Int(interval.rounded())
        } else {
            self.daysRemaining = 0
        }
        
        if !(self.startDate > self.deadline) {
            let currentDate = Date()
            let interval = (DateInterval(start: self.startDate, end: currentDate)).duration / 86400
            self.daysElapsed = Int(interval.rounded())
        } else {
            self.daysElapsed = 0
        }
        
        if self.daysRemaining != 0 {
            self.wordsPerDayForTarget = self.wordsRemaining / self.daysRemaining
        } else {
            self.wordsPerDayForTarget = self.wordsRemaining
        }
        
//        self.dailyWordCount = []
        
        self.daysOfWriting = self.dailyWordCount.count
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        targetWordCount = aDecoder.decodeInteger(forKey: "targetWordCount")
        deadline = aDecoder.decodeObject(forKey: "deadline") as! Date
        cumulativeWordCount = aDecoder.decodeInteger(forKey: "cumulativeWordCount")
        percentComplete = aDecoder.decodeInteger(forKey: "percentComplete")
        startDate = aDecoder.decodeObject(forKey: "startDate") as! Date
        wordsRemaining = aDecoder.decodeInteger(forKey: "wordsRemaining")
        daysElapsed = aDecoder.decodeInteger(forKey: "daysElapsed")
        daysRemaining = aDecoder.decodeInteger(forKey: "daysRemaining")
        dailyWordCount = aDecoder.decodeObject(forKey: "dailyWordCount") as! [WordsTuple]
        genre = aDecoder.decodeObject(forKey: "genre") as? String
        wordsPerDayForTarget = aDecoder.decodeObject(forKey: "wordsPerDayForTarget") as! Int?
        daysOfWriting = aDecoder.decodeInteger(forKey: "daysOfWriting")
        
        super.init()
    }
    
    func getDaysRemaining(deadline: Date) {
        let currentDate = Date()
        let interval = DateInterval(start: currentDate, end: self.deadline).duration / 86400
        self.daysRemaining = Int(interval.rounded())
    }
    
    func getReadableDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "en_US")
        let dateAsString = formatter.string(from: date)
        return dateAsString
    }
    
    func updatePercentComplete(count: Int, target: Int) -> Double {
        if target != 0 {
            print(count, target)
            return (Double(count).divided(by: Double(target)) * 100)
        } else {
            print("returning 0")
            return 0
        }
    }
}

extension Project: NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(targetWordCount, forKey: "targetWordCount")
        aCoder.encode(deadline, forKey: "deadline")
        aCoder.encode(cumulativeWordCount, forKey: "cumulativeWordCount")
        aCoder.encode(percentComplete, forKey: "percentComplete")
        aCoder.encode(startDate, forKey: "startDate")
        aCoder.encode(wordsRemaining, forKey: "wordsRemaining")
        aCoder.encode(daysRemaining, forKey: "daysRemaining")
        aCoder.encode(dailyWordCount, forKey: "dailyWordCount")
        aCoder.encode(genre, forKey: "genre")
        aCoder.encode(wordsPerDayForTarget, forKey: "wordsPerDayForTarget")
        aCoder.encode(daysOfWriting, forKey: "daysOfWriting")
    }
}
