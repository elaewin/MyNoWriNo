//
//  Extensions.swift
//  MyNoWriNo
//
//  Created by Erica Winberry on 11/7/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

extension UIResponder {
    
    static var identifier: String {
        return String(describing: self)
    }
}
