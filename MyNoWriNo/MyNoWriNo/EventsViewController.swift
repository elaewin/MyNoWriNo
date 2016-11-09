//
//  EventsViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    var project: Project!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
        }
        
    }

}
