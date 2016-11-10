//
//  ProjectTabBarController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class ProjectTabBarController: UITabBarController {

    var project: Project! {
        didSet {
            //save overall Project Array?
        }
    }
    var indexPassedThrough: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.project.name)
        print(self.project.targetWordCount)
        print(self.project.deadline)
        print(self.project.cumulativeWordCount)
        print(self.project.percentComplete)
        print(self.project.startDate)
        print(self.project.wordsRemaining)
        print(self.project.daysElapsed)
        print(self.project.daysRemaining)
        print(self.project.wordsPerDayForTarget!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


