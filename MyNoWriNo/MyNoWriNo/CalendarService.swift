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
    
    var newCalendar: EKCalendar
    
    override init() {
        
        self.newCalendar = EKCalendar(for: .event, eventStore: CalendarService.shared)
        
        super.init()
        
        let sourcesInEventStore = self.sources
        
        newCalendar.source = sourcesInEventStore.filter({ (source: EKSource) -> Bool in
            source.sourceType.rawValue == EKSourceType.local.rawValue
        }).first!
        
        do {
            try self.saveCalendar(newCalendar, commit: true)
            UserDefaults.standard.set(newCalendar.calendarIdentifier, forKey: "MyNoWriNoPrimaryCalendar")
        } catch {
            print("Did not save calendar.")
        }
        
        
    }
    
    
    func getAccessToCalendar() {
        self.requestAccess(to: .event, completion: {(granted: Bool, error: Error?) in
            if granted == false {
                print("Access to store not granted")
            }
        })
    }
    
}
    
extension CalendarService: EventAddedDelegate {
    
    func newEventAdded() {
        
    }
    
}
