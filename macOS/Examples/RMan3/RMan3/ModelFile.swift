//
//  ModelFile.swift
//  RMan3
//
//  Created by Court on 2017-06-03.
//  Copyright © 2017 Forte Development Inc. All rights reserved.
//

import Foundation
import JSON

class Employee : JSON {
    static var employees: [Employee] = []
    var name : String? = "New"
    var raise = 0.03
    var amount = 200.00
}
