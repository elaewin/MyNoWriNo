//
//  ProjectCollectionCell.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class ProjectCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var projectNameLabel: UILabel!
    
    @IBOutlet weak var deadlineLabel: UILabel!
    
    @IBOutlet weak var percentCompleteLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    var project: Project! {
        didSet {
            self.projectNameLabel.text = project.name
            
            let dateAsString = getReadableDate(project.deadline)
            
            self.deadlineLabel.text = "Deadline: \(dateAsString)"
            self.percentCompleteLabel.text = String(project.percentComplete)
            if let genre = project.genre {
                self.genreLabel.text = genre
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getReadableDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "en_US")
        let dateAsString = formatter.string(from: date)
        return dateAsString
    }
}
