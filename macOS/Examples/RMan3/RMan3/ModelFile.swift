//
//  ModelFile.swift
//  RMan3
//
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
