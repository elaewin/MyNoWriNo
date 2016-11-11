//
//  WordCountCell.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/9/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class WordCountCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var wordCountLabel: UILabel!
    
    var wordCount: WordsTuple! {
        didSet {
            self.dateLabel.text = Projects.shared.getReadableDateMedium(wordCount.date)
            self.wordCountLabel.text = "\(wordCount.count)"
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
