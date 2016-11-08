//
//  AlertsViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class AlertsViewController: UIViewController {

    var project: Project!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
        }
        
        // Do any additional setup after loading the view.
    }


}
