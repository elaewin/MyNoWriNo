//
//  wordsTuple.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/10/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import Foundation

class WordsTuple: NSObject, NSCoding {
    
    let date: Date
    let count: Int
    
    init(date: Date, count: Int) {
        self.date = date
        self.count = count
    }
    
    required init?(coder aDecoder: NSCoder) {
        date = aDecoder.decodeObject(forKey: "date") as! Date
        count = aDecoder.decodeInteger(forKey: "count")
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(count, forKey: "count")
    }
}
