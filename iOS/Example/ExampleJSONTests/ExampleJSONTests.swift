//
//  ExampleJSONTests.swift
//  ExampleJSONTests
//
//  Created by Brandon Gray on 4/6/17.
//  Copyright © 2017 Brandon Gray. All rights reserved.
//

import XCTest
import JSON
@testable import ExampleJSON

class ExampleJSONTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        print("\n**********************************************************************\nUNIT TEST BEGIN\n")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJSON () {
        
        // Instance of data
        let allData = AllData()
        let dict = ["Glossary": ["Title": "example glossary", "GlossDiv": ["Title": "S", "GlossList": ["GlossEntry": [["GlossDef": ["GlossSeeAlso": ["GML", "XML"], "Para": "A meta-markup language, used to create markup languages such as DocBook."], "SortAs": "SGML", "GlossTerm": "Standard Generalized Markup Language", "Abbrev": "ISO 8879:1986", "Acronym": "SGML", "GlossSee": "markup", "Id": "SGML"], ["GlossDef": ["GlossSeeAlso": ["GML", "HTML"], "Para": "The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks."], "SortAs": "XML", "GlossTerm": "Extensible Markup Language", "Abbrev": "ISO xxxx:xxxx", "Acronym": "XML", "GlossSee": "markup", "Id": "XML"]]]]]]
        let string = "{\"Glossary\":{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":[{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"XML\"],\"Para\":\"A meta-markup language, used to create markup languages such as DocBook.\"},\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Abbrev\":\"ISO 8879:1986\",\"Acronym\":\"SGML\",\"GlossSee\":\"markup\",\"Id\":\"SGML\"},{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"HTML\"],\"Para\":\"The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks.\"},\"SortAs\":\"XML\",\"GlossTerm\":\"Extensible Markup Language\",\"Abbrev\":\"ISO xxxx:xxxx\",\"Acronym\":\"XML\",\"GlossSee\":\"markup\",\"Id\":\"XML\"}]}}}}"
        
        // Populate instance with a dictionary, converting JSON string to a dictionary
        allData.JSONtoClass(dict: dict)
        
        
        XCTAssert(dict.json == string)
        XCTAssert(allData.toDict.description == dict.description)
        XCTAssert(allData.glossary.title == "example glossary")
        XCTAssert(allData.toJSONDict == dict.json)
    }
}
