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
    
    @IBOutlet weak var dailyWordsRequiredLabel: UILabel!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.deleteButton.layer.cornerRadius = 5
        
        updateData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destinationController = segue.destination as? EditProjectViewController {
            destinationController.project = self.project
//            destinationController.delegate = self
        }
    }
    
    func updateData() {
        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
            self.index = projectTabBarController.indexPassedThrough
        }
        
        self.projectTitleLabel.text = self.project.name
        self.deadlineLabel.text = Projects.shared.getReadableDateMedium(project.deadline)
        self.totalWordCountLabel.text = "\(self.project.cumulativeWordCount) of \(self.project.targetWordCount) goal"
        self.daysLeftInProject.text = "(\(getCurrentDaysRemaining(startDate: self.project.startDate, deadline: self.project.deadline)) days remaining)"
        self.dailyWordsRequiredLabel.text = "\(getDailyWordCountRequired(daysRemaining: self.project.daysRemaining, targetNumber: self.project.targetWordCount, cumulativeWords: self.project.cumulativeWordCount))"
    }
     
    func getDailyWordCountRequired(daysRemaining: Int, targetNumber: Int, cumulativeWords: Int) -> Int {
        var dailyMinimum = 0
        if daysRemaining != 0 && cumulativeWords < targetNumber {
            let wordsRemaining = targetNumber - cumulativeWords
            dailyMinimum = wordsRemaining / daysRemaining
        }
        return dailyMinimum
    }
    
    func getCurrentDaysRemaining(startDate: Date, deadline: Date) -> Int {
        if !(startDate > deadline) {
            let currentDate = Date()
            let interval = (DateInterval(start: currentDate, end: deadline)).duration / 86400
            return Int(interval.rounded())
        } else {
            return 0
        }
    }
    
    // MARK: Actions
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func editButtonPressed(_ sender: Any) {
//        self.performSegue(withIdentifier: "EditCurrentProjectSegue", sender: nil)
//    }

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

//extension DetailsViewController: EditProjectViewControllerDelegate {
//    func updateProject(newTitle: String, newDate: Date, newTarget: Int) {
//        self.project.name = newTitle
//        self.project.deadline = newDate
//        self.project.targetWordCount = newTarget
//        Projects.shared.saveProjectData()
//    }
//}
