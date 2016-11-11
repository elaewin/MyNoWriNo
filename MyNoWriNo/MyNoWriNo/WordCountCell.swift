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
            self.dateLabel.text = getReadableDate(wordCount.date)
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
    
    func getReadableDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        let dateAsString = formatter.string(from: date)
        return dateAsString
    }

}
