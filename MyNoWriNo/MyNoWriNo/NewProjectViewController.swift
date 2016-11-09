//
//  NewProjectViewController.swift
//  MyNoWriNo
//
//  Created by Corey Malek on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import EventKit

protocol NewProjectControllerDelegate: class {
    func newProjectCreated(project: Project)
}

class NewProjectViewController: UIViewController {
    
    weak var delegate: NewProjectControllerDelegate?
    weak var newEventDelegate: EventAddedDelegate?
    
    var newProject: Project?
    
    var newDate: Date?
    
    @IBOutlet weak var newProjectView: UIView!
    
    @IBOutlet weak var projectTitleTextField: UITextField!
    
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    
    @IBOutlet weak var wordCountTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!

    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var saveDeadlineSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deadlineDatePicker.minimumDate = Date()
        
        self.projectTitleTextField.delegate = self
        self.wordCountTextField.delegate = self
        self.genreTextField.delegate = self
    }
    
    @IBAction func newDueDateSelected(_ sender: Any) {
        newDate = deadlineDatePicker.date
        print("New Date Selected is: \(newDate)")
    }
    
    func newEventAdded() {
        
    }
    
//    func writeToCalendar(projectTitle: String, deadline: Date) {
//        
//        let eventStore = CalendarService.shared
//        
//        if let calendarForEvent = eventStore.calendar(withIdentifier: "MyNoWriNoPrimaryCalendar") {
//            
//            let newEvent = EKEvent(eventStore: eventStore)
//            
//            newEvent.calendar = calendarForEvent
//            newEvent.title = projectTitle
//            newEvent.startDate = deadline
//            newEvent.endDate = deadline
//            
//            do {
//                try eventStore.save(newEvent, span: .thisEvent)
//                
//            } catch {
//                print("add error handling here.")
//            }
//        }
//        
//    }
    
    
    @IBAction func createButtonPressed(_ sender: Any) {
       
        
        guard let delegate = self.delegate else { return }
        
        if projectTitleTextField.text != "" && wordCountTextField.text != "" && newDate != nil {
            print("Create button pressed")
            let wordCount = Int(wordCountTextField.text!)
            self.newProject = Project(name: projectTitleTextField.text!, targetWordCount: wordCount!, deadline: self.newDate!)            
            if let genre = genreTextField.text {
                newProject?.genre = genre
            }
            if saveDeadlineSwitch.isOn {
//                CalendarService.shared.getAccessToCalendar()
//                writeToCalendar(projectTitle: projectTitleTextField.text!, deadline: deadlineDatePicker.date)
            }
            delegate.newProjectCreated(project: newProject!)

        }
        
        dismiss(animated: true, completion: nil)
        
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension NewProjectViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if projectTitleTextField.text != "" && wordCountTextField.text != "" {
            createButton.isEnabled = true
        }
    }
}







