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
    
    let entityType = EKEntityType.event
    
    static let shared = CalendarService()
    
    override func requestAccess(to entityType: EKEntityType, completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        
    }
    
    
    
}
    
   
