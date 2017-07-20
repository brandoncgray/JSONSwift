//
//  ViewController.swift
//  ExampleJSONMacOS
//
//  Created by Brandon Gray on 7/18/17.
//  Copyright © 2017 Brandon Gray. All rights reserved.
//

import Cocoa
import JSON

class ViewController: NSViewController {

    override func viewDidLoad() {
//        JSONRegistration.setup(company: "Test Company", registrationIDs:
//            ["c3d4fc2d45cc3874265acedfd0c7057ee7939cf0719e32bc72a31abc8b3a1e5b"]
//        )
        super.viewDidLoad()
        // Instance of data
        let allData = AllData()
        
        // Populate instance var with a dictionary, converting JSON string to a dictionary
        allData.JSONtoClass(dict: jsonDataString.JSONToDictionary)
        
        // Populate static var with a dictionary, converting JSON string to a dictionary
        StaticData.glossary1.JSONtoClass(dict: jsonDataString.JSONToDictionary)
        StaticData.glossary2.JSONtoClass(dict: jsonDataString.JSONToDictionary)
        
        //Merging data
        // First merge the data - JSONTo"Array" is only for the root of the JSON
        let mergedArray = jsonArrayDataString.JSONToArray.combine(array: jsonArrayDataString.JSONToArray)
        // Populate static var with a array using the property name in the class
        StaticData.mergedGlossaries.JSONtoClass(propertyName: "glossary", array: mergedArray)
        
        // Convert class to dictionary
        print("Convert class to dictionary:\n",
              allData.toDict,
              "\n")
        
        // Convert class to dictionary and then convert dictionary to JSON string
        print("Convert class to dictionary and then convert dictionary to JSON string:\n",
              allData.toDict.json,
              "\n")
        
        // Convert class to array
        print("Convert class to array:\n",
              allData.toArray,
              "\n")
        
        // Convert class to array and then convert array to JSON string
        print("Convert class to array and then convert array to JSON string:\n",
              allData.toArray.json,
              "\n")
        
        // Convert class to array that contains a dictionary and then convert it to JSON string
        print("Convert class to array that contains a dictionary and then convert it to JSON string:\n",
              allData.toArray.json,
              "\n")
        
        // Convert class to JSON string - Use this if the root is a dictionary and the rest is mixed dictionary and array
        print("Convert class to JSON string - Use this if the root is a dictionary and the rest is mixed dictionary and array:\n",
              StaticData.glossary1.toJSONDict,
              "\n")
        
        // Convert class to JSON array string - Use this if everything is an array
        print("Convert class to JSON array string - Use this if everything is an array:\n",
              StaticData.glossary2.toJSONArray,
              "\n")
        
        // Convert class to JSON array string - Use this if the root is an array but the rest is mixed dictionary and array
        print("Convert class to JSON array string - Use this if the root is an array but the rest is mixed dictionary and array:\n",
              StaticData.glossary2.toJSONArrayDict,
              "\n")
        
        print("Merged data from two arrays:\n",
              StaticData.mergedGlossaries.toJSONDict,
              "\n")
                allData.save()
        print(allData.glossary.title)
        allData.glossary.title = "This is a test"
                allData.load()
        

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

