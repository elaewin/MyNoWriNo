//
//  EditProjectViewController.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/10/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

protocol EditProjectViewControllerDelegate: class {
    func updateProject(newTitle: String, newDate: Date, newTarget: Int)
}

class EditProjectViewController: UIViewController {
    
    var project: Project!
    var newTitle: String?
    var newDate: Date?
    var newTarget: String?

    weak var delegate: EditProjectViewControllerDelegate?
    
    @IBOutlet weak var updateTitleTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var updateTargetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = self.project.deadline
        datePicker.minimumDate = Date()
        
        self.updateTitleTextField.text = self.project.name
        self.updateTitleTextField.allowsEditingTextAttributes = true
        
        self.updateTargetTextField.text = "\(self.project.targetWordCount)"
        self.updateTargetTextField.allowsEditingTextAttributes = true

        // Do any additional setup after loading the view.
    }

    @IBAction func updatedProjectTitleEntered(_ sender: Any) {
        if self.updateTitleTextField.text != "" {
            self.newTitle = self.updateTitleTextField.text
        }
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        self.newDate = datePicker.date
    }
    
    @IBAction func updatedTargetWordCountEntered(_ sender: Any) {
        if self.updateTargetTextField.text != "" {
            self.newTarget = self.updateTargetTextField.text
        }
    }
    
    @IBAction func updateProjectButtonPressed(_ sender: Any) {
        if self.updateTitleTextField.text != "" && self.updateTargetTextField.text != "" {
//            if (self.newTitle != nil) && self.newTitle != "" {
//                self.project.name = self.newTitle
//            }
//            if (self.newDate != nil) {
//                self.project.deadline = self.newDate
//            }
//            if (self.newTarget != nil) && self.newTarget != "" {
//                self.project.targetWordCount = Int(self.newTarget!)!
//            }
            Projects.shared.saveProjectData()
            self.dismiss(animated: true, completion: nil)
        } else {
            // fire off alert!
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension EditProjectViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !(string.numberIsValid) {
            let lastIndex = string.index(before: string.endIndex)
            updateTargetTextField.text = string.substring(to: lastIndex)
        }
        return true
    }
}







