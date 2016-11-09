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
            
            if let wordCount = project.dailyWordCount {
                for (date, count) in wordCount {
                    print("\(date), w/c: \(count)")
                }
            }
        }

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
        
        for dictionary in project.dailyWordCount?.sorted(by: { $0.key, $1.key } )
        
        let currentRecord = self.project.dailyWordCount[indexPath.row]
        
        cell.record = (currentRecord.key, currentRecord.value)
        
        return cell
    }
}
