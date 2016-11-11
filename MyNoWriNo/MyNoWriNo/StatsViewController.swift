//
//  StatsViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var project: Project!
    
    @IBOutlet weak var percentCompleteLabel: UILabel!
    
    @IBOutlet weak var wordsToTargetLabel: UILabel!
        
    @IBOutlet weak var finalWordCountAtPaceLabel: UILabel!
    
    @IBOutlet weak var averageWordsPerDayLabel: UILabel!
    
    @IBOutlet weak var averageWordsPerWeekLabel: UILabel!
    
    @IBOutlet weak var averageWordsPerMonthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
            
            self.percentCompleteLabel.text = "\(self.project.updatePercentComplete(count: project.cumulativeWordCount, target: project.targetWordCount))%"
            
            self.wordsToTargetLabel.text = "\(project.wordsRemaining)"
            
            self.finalWordCountAtPaceLabel.text = "\(calculateWordCountAtPace(count: project.cumulativeWordCount, daysRemaining: project.daysRemaining, daysElapsed: project.daysElapsed))"
            
            self.averageWordsPerDayLabel.text = "\(calculateDailyAverage(count: project.cumulativeWordCount, days: project.daysOfWriting))"
            
            self.averageWordsPerWeekLabel.text = "\(calculateWeeklyAverage(count: project.cumulativeWordCount, days: project.daysElapsed))"
            
            self.averageWordsPerMonthLabel.text = "\(calculateMonthlyAverage(count: project.cumulativeWordCount, days: project.daysElapsed))"
            
        }

    }

    func calculateWordCountAtPace(count: Int, daysRemaining: Int, daysElapsed: Int) -> Int {
        if daysElapsed == 0 {
            return count
        } else {
            let currentPace = count / daysElapsed
            let projectedPace = currentPace * daysRemaining
            return projectedPace
        }
    }
    
    func calculateDailyAverage(count: Int, days: Int) -> Int {
        if days > 0 {
            return count / days
        } else {
            return 0
        }
    }
    
    func calculateWeeklyAverage(count: Int, days: Int) -> Int {
        if days < 7 {
            return count
        } else {
        return (count / days) * 7
        }
    }
        
    func calculateMonthlyAverage(count: Int, days: Int) -> Int {
        if days < 30 {
            return count
        } else {
            return (count / days) * 30
        }
    }
    
}
