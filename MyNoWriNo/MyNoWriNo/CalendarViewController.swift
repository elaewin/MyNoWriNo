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
    
    var project: Project!
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            self.project = projectTabBarController.project
        }
        
        let nib = UINib(nibName: "WordCountCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: WordCountCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destinationController = segue.destination as? AddCountViewController {
            destinationController.delegate = self
        }
    }
        
    @IBAction func addNewButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "AddWordCountSegue", sender: nil)
    }
    
}


extension CalendarViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.project.dailyWordCount?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCountCell.identifier, for: indexPath) as! WordCountCell
        
        let wordCountArray = project.dailyWordCount
        
        let sorted = wordCountArray?.sorted(by: { $0.date < $1.date })
        
        let currentCount = sorted![indexPath.row]
        
        cell.wordCount = currentCount
        
        return cell
    }
    
    func getUniqueDates() -> Int {
        var datesArray = [String]()
        for item in self.project.dailyWordCount! {
            let date = self.project.getReadableDate(item.date)
            datesArray.append(date)
        }
        let datesSet = Set(datesArray)
        return datesSet.count
    }
    
}

extension CalendarViewController: AddCountViewControllerDelegate {
    func addNewWordCount(newDate: Date, newCount: Int) {
        let newRecord = (date: newDate, count: newCount)
        print(newRecord)
        self.project.dailyWordCount?.append(newRecord)
        self.project.cumulativeWordCount += newRecord.count
        self.project.daysOfWriting = getUniqueDates()
        if let projectTabBarController = self.tabBarController as? ProjectTabBarController {
            print("\(projectTabBarController.project.dailyWordCount?.count)")
            for item in projectTabBarController.project.dailyWordCount! {
                print(item)
            }
        }
    }
}
