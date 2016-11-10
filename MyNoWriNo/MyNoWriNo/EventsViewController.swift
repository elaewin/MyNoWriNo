//
//  EventsViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    var mainTimer: Timer!
    var secondsRemaining: TimeInterval!
    
    @IBOutlet weak var sprintTimer: UIDatePicker!

    
    @IBAction func startTimer(_ sender: Any) {
        
        self.secondsRemaining = self.sprintTimer.countDownDuration
        
        self.mainTimer = Timer.scheduledTimer(withTimeInterval: self.secondsRemaining, repeats: false, block: @escaping )
        
    }
    
    
    @IBAction func stopTimer(_ sender: Any) {
        
    }
    
    
    func finishMainTimer() {
        self.stopTimer(mainTimer)
    }
    
    
    
    var project: Project!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
        }
        
    }

}
