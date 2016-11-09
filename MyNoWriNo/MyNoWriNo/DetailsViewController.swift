//
//  DetailsViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/8/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

protocol DetailsViewControllerDelegate: class {
    func deleteProject(index: Int)
}

class DetailsViewController: UIViewController {

    var project: Project!
    var index: Int!
    
    weak var delegate: DetailsViewControllerDelegate?
    
    @IBOutlet weak var projectTitleLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var totalWordCountLabel: UILabel!
    
    @IBOutlet weak var daysLeftInProject: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
            self.index = projectTabBarController.indexPassedThrough
        }
        
        self.projectTitleLabel.text = self.project.name
        self.deadlineLabel.text = self.project.getReadableDate(project.deadline)
        self.totalWordCountLabel.text = "\(self.project.cumulativeWordCount) of \(self.project.targetWordCount) goal"
        self.daysLeftInProject.text = "(\(self.project.daysRemaining) days remaining)"
        
        // Do any additional setup after loading the view.
    }

    
    // MARK: Actions
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
    }

    @IBAction func deleteButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "ALERT", message: "Are you sure you want to delete this project?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Delete Project", style: .destructive) { (alert) in
            guard let delegate = self.delegate else { return }
            
            
            delegate.deleteProject(index: self.index)
            
            self.dismiss(animated: true, completion: nil)
            }
    
        alert.addAction(deleteAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
