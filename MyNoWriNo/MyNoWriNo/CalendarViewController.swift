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

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
}

