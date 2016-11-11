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
            
            let dateAsString = project.getReadableDate(project.deadline)
            
            self.deadlineLabel.text = "Deadline: \(dateAsString)"
            
            let rawPercentage = self.project.updatePercentComplete(count: self.project.cumulativeWordCount, target: self.project.targetWordCount)
            self.percentCompleteLabel.text = "\(Projects.shared.roundToPlaces(value: rawPercentage, decimalPlaces: 1))"
            if let genre = project.genre {
                self.genreLabel.text = genre
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
