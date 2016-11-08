//
//  CalendarViewController.swift
//  MyNoWriNo
//
//  Created by Corey Malek on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import EventKit

class CalendarViewController: UIViewController {

    
    let eventStore = EKEventStore()
    
    func requestAccessToCalendar() {
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            
            if accessGranted == true {
                
                // we want to be able to write to the calendar 
                
            } else {
                // we want to be able to simply save project details
            }
        
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    
    func checkCalendarAuthStatus() {
        
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        requestAccessToCalendar()
        
    }
    
    
    
    

}
