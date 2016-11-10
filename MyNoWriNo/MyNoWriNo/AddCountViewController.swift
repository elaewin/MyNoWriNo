//
//  AddCountViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/9/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

protocol AddCountViewControllerDelegate: class {
    func addNewWordCount(newDate: Date, newCount: Int)
}

class AddCountViewController: UIViewController {
    
    weak var delegate: AddCountViewControllerDelegate?
    
    var newDate: Date?

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var totalWordsTextBox: UILabel!
    
    @IBOutlet weak var addWordCountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func newDatePicked(_ sender: Any) {
        newDate = datePicker.date
    }
    
    @IBAction func addWordCountButtonPressed(_ sender: Any) {
        guard let delegate = self.delegate else { return }

        if newDate == nil && totalWordsTextBox.text != "" {
            let date = Date()
            let count = Int(totalWordsTextBox.text!)
            delegate.addNewWordCount(newDate: date, newCount: count!)
        }
        
        if newDate != nil && totalWordsTextBox.text != "" {
            let date = datePicker.date
            let count = Int(totalWordsTextBox.text!)
            delegate.addNewWordCount(newDate: date, newCount: count!)
        }
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddCountViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if totalWordsTextBox.text != "" {
            addWordCountButton.isEnabled = true
        }
    }
}
