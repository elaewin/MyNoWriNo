//
//  ProjectTabBarController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class ProjectTabBarController: UITabBarController {

    var project: Project!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ProjectTabBarController: HomeViewControllerDelegate {
    
    func getProject(project: Project) {
        self.project = project
    }
    
}
