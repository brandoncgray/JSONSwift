//
//  ModelFile.swift
//  RMan3
//
//  Created by Court on 2017-06-03.
//  Copyright © 2017 Forte Development Inc. All rights reserved.
//

import Foundation
import JSON

// Array Controlers don't like nessted arrays
class EmployeeModel : JSON {
    static var data = EmployeeModel()
    var employees = [Employee()]
}

class Employee: JSON {
    var name : String? = "New"
    var raise = 0.03
    var amount = 200.00
}
