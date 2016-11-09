//
//  CalendarService.swift
//  MyNoWriNo
//
//  Created by Corey Malek on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import EventKit


class CalendarService: EKEventStore {
    
    static let shared = CalendarService()
    
    func getAccessToCalendar() {
        self.requestAccess(to: .event, completion: {(granted: Bool, error: Error?) in
            if !granted {
                print("Access to store not granted")
            }
        })
    }
    

}
    
   
