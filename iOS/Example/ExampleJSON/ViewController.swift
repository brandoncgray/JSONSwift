//
//  ViewController.swift
//  ExampleJSON
//
//  Created by Brandon Gray on 4/6/17.
//  Copyright © 2017 Brandon Gray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Instance of data
        let allData = AllData()
        
        // Populate instance var with a dictionary, converting JSON string to a dictionary
        allData.JSONtoClass(dict: jsonDataString.JSONToDictionary)
        
        // Populate static var 
        StaticData.glossary1.JSONToClass(jsonString: jsonDataString)
        StaticData.glossary2.JSONToClass(jsonString: jsonDataString)
        
        //Merging data
        // First merge the data - JSONTo"Array" is only for the root of the JSON
        let mergedArray = jsonArrayDataString.JSONToArray.combine(array: jsonArrayDataString.JSONToArray)
        // Populate static var with a array using the property name in the class
        StaticData.mergedGlossaries.JSONtoClass(propertyName: "glossary", array: mergedArray)
        // This will detect if it is a dictionary or array. If it is an array it will put the data in the first array that it finds.
        StaticData.mergedGlossaries.JSONToClass(jsonString: mergedArray.json)

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
              StaticData.mergedGlossaries.glossary.json,
              "\n")
        
        let otherTypes = OtherTypes()
        otherTypes.color = UIColor.blue
        
        print("UIColor and Date:\n",
              otherTypes.toJSONDict,
              "\n")
        
        PopulateData.doWorkTheJSONSwiftWay()
        PopulateData.doWorkTheStandardWay()
        //Persisting Data Using JSONSwift's Database
        print("//////////////////////////////////////////////////////","\n","Persisting Data Using JSONSwift's Database\n" )
        let string = "This is the new title I want to save to the database"
        
        // Set desc to string
        PopulateData.theJSONSwiftWay.addon.desc = string
        
        // Save theJSONSwiftWay
        PopulateData.theJSONSwiftWay.save()
        print("Run Code Twice to See Data Persisted\n",
              "Follow the link below to view the database file\n")
        
        // Change string before load
        PopulateData.theJSONSwiftWay.addon.desc = "I am changing the desc before I load the database data"
        
        // Load from database
        PopulateData.theJSONSwiftWay.load()
        print("\nWas data saved and loaded? -",string == PopulateData.theJSONSwiftWay.addon.desc,"\n")

        print("Save and Load both have 2 callbacks\n",
              "Save will return a bool\nLoad will return a string\n",
              "Save - JSONSaveOptions is required everything else is not\n",
              "Save can also encrypt data\n",
              "Load will auto detect JSONSaveOptions type and if data is encrypted/n")
        
        print("Encryption:")
        allData.save(didWrite: { (bool) in
            print("Callback didWrite:",bool)
        })

        let didSave = allData.save(encrypt: true){
            print("Callback")
        }
        assert(didSave)
        
        allData.save(encrypt: true, didWrite: { (bool) in
            print("Callback didWrite and Encrypted:",bool)
        })
        
        allData.load(didLoad: { (bool) in
            print("Callback didLoad:",bool)
        })
//        print(allData.glossary.glossDiv.glossList.glossEntry[0].abbrev)
        
        print("\n Test -",allData.toJSONDict,"\n")

        allData.JSONtoClass(dict: jsonDataString2.JSONToDictionary)
        dump(allData)
        print("\n Test -",allData.toJSONDict,"\n")

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

