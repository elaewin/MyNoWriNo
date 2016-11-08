//
//  CalendarViewController.swift
//  MyNoWriNo
//
//  Created by Corey Malek on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import EventKit

typealias CalendarAuthCompletion = (Bool) -> ()



class CalendarViewController: UIViewController {
    
    
    let eventStore = EKEventStore()
    
    
    func checkCalendarAuthStatus() {
        
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
    }

    
    
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            
        }
            
            
            

    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkCalendarAuthStatus()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
}
