//
//  DetailsViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var project: Project!
    
    @IBOutlet weak var projectTitleLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var totalWordCountLabel: UILabel!
    
    @IBOutlet weak var daysLeftInProject: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
        }
        
        
        // Do any additional setup after loading the view.
    }

    
    // MARK: Actions
    @IBAction func editButtonPressed(_ sender: Any) {
    }

    @IBAction func deleteButtonPressed(_ sender: Any) {
    }
    
    
}

extension DetailsViewController: HomeViewControllerDelegate {
    
    func getProject(project: Project) {
        self.project = project
    }
    
}
