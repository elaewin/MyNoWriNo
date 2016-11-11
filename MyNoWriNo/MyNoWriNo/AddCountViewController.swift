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
    
    @IBOutlet weak var totalWordsTextField: UITextField!
    
    @IBOutlet weak var addWordCountButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addWordCountButton.layer.cornerRadius = 5
        
        self.cancelButton.layer.cornerRadius = 5
        datePicker.maximumDate = Date()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func newDatePicked(_ sender: Any) {
        newDate = datePicker.date
    }
    
    @IBAction func addWordsNumberEntered(_ sender: Any) {
        if totalWordsTextField.text != "" {
            addWordCountButton.isEnabled = true
        }
    }
    
    @IBAction func addWordCountButtonPressed(_ sender: Any) {
        guard let delegate = self.delegate else { return }

        if newDate == nil && totalWordsTextField.text != "" {
            let date = Date()
            let count = Int(totalWordsTextField.text!)
            if count != 0 && count != nil {
                delegate.addNewWordCount(newDate: date, newCount: count!)
                self.dismiss(animated: true, completion: nil)
            } else {
                print("did not save new word count data.")
            }
        }
        
        if newDate != nil && totalWordsTextField.text != "" {
            let date = datePicker.date
            let count = Int(totalWordsTextField.text!)
            if count != 0 {
                delegate.addNewWordCount(newDate: date, newCount: count!)
                self.dismiss(animated: true, completion: nil)
            } else {
                //fire off alert
            }
        }
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddCountViewController: UITextFieldDelegate {
       
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !(string.numberIsValid) {
            let lastIndex = string.index(before: string.endIndex)
            totalWordsTextField.text = string.substring(to: lastIndex)
        }
        return true
    }
}

