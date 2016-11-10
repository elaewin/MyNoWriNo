//
//  CalendarService.swift
//  MyNoWriNo
//
//  Created by Corey Malek on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import EventKit

class CalendarService {
    
    static let shared = CalendarService()
    
    let store = EKEventStore()
    
    var newCalendar: EKCalendar
    
     private init() {
        
        self.newCalendar = store.defaultCalendarForNewEvents

    }
    
    
    func getAccessToCalendar(completion: @escaping ()->()) {
            self.store.requestAccess(to: .event, completion: {(granted: Bool, error: Error?) in
                
                if !granted {
                    print("Access to store not granted with possible error: \(error)")
                } else {
                    OperationQueue.main.addOperation {
                        completion()
                    }
                }
            })
    }
    
}
    
extension CalendarService: EventAddedDelegate {
    
    func newEventAdded() {
        
    }
    
}
