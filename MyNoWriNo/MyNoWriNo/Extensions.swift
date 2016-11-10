//
//  Extensions.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

extension String {
    
    var textIsValid: Bool {
        
        let regexPattern = "[^0-9a-z]"
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: (self.characters.count))
            let matches = regex.numberOfMatches(in: self, options: .reportCompletion, range: range)
            if matches > 0 { return false }
        } catch {
            return false
        }
        return true
    }
    
    var numberIsValid: Bool {
        
        let regexPattern = "[^0-9]"
        
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: (self.characters.count))
            let matches = regex.numberOfMatches(in: self, options: .reportCompletion, range: range)
            if matches > 0 { return false }
        } catch {
            return false
        }
        return true
    }
    
}


extension UIResponder {
    
    static var identifier: String {
        return String(describing: self)
    }
}


extension URL {
    func getDocumentsDirectory() -> URL {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError("Error getting documents directories.") }
        return documentsDirectory
    }
}


