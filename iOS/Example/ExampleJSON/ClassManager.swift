//
//  ClassManager.swift
//  ExampleJSON
//
//  Created by Brandon Gray on 4/6/17.
//  Copyright © 2017 Brandon Gray. All rights reserved.
//

import UIKit
import JSON

let jsonDataString = "{\"Glossary\":{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":nil}}}}"
let jsonDataString2 = "{\"Glossary\":{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":[{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"XML\"],\"Para\":\"A meta-markup language, used to create markup languages such as DocBook.\"},\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Acronym\":\"ISO 8879:1986\",\"Abbrev\":1415637900,\"GlossSee\":\"markup\",\"Id\":\"SGML\"},{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"HTML\"],\"Para\":\"The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks.\"},\"SortAs\":\"XML\",\"GlossTerm\":\"Extensible Markup Language\",\"Acronym\":\"ISO 8879:1986\",\"Abbrev\":1415637900,\"GlossSee\":\"markup\",\"Id\":\"XML\"}]}}}}"

let jsonArrayDataString = "[{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":[{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"XML\"],\"Para\":\"A meta-markup language, used to create markup languages such as DocBook.\"},\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Acronym\":\"ISO 8879:1986\",\"Abbrev\":1415637900,\"GlossSee\":\"markup\",\"Id\":\"SGML\"},{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"HTML\"],\"Para\":\"The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks.\"},\"SortAs\":\"XML\",\"GlossTerm\":\"Extensible Markup Language\",\"Acronym\":\"ISO 8879:1986\",\"Abbrev\":1415637900,\"GlossSee\":\"markup\",\"Id\":\"XML\"}]}}},{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":[{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"XML\"],\"Para\":\"A meta-markup language, used to create markup languages such as DocBook.\"},\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Acronym\":\"ISO 8879:1986\",\"Abbrev\":1415637900,\"GlossSee\":\"markup\",\"Id\":\"SGML\"},{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"HTML\"],\"Para\":\"The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks.\"},\"SortAs\":\"XML\",\"GlossTerm\":\"Extensible Markup Language\",\"Acronym\":\"ISO 8879:1986\",\"Abbrev\":1415637900,\"GlossSee\":\"markup\",\"Id\":\"XML\"}]}}}]"

class AllData:JSON {
    
    var glossary = Glossary()
    
    class Glossary:JSON {
        var title = ""
        var glossDiv = GlossDiv()
    }
    class GlossDiv:JSON {
        var title = ""
        var glossList = GlossList()
    }
    class GlossList:JSON {
        var glossEntry = [GlossEntry()]
    }
    class GlossEntry:JSON {
        var id = ""
        var sortAs = ""
        var glossTerm = ""
        var acronym = ""
        var abbrev = Date()
        var glossDef = GlossDef()
        var glossSee = ""
    }
    class GlossDef:JSON {
        var para = ""
        var glossSeeAlso = [String]()
    }
}

//or nest every class
class AllData2:JSON {
    
    var glossary = Glossary()
    
    class Glossary:JSON {
        var title = ""
        var glossDiv = GlossDiv()
        
        class GlossDiv:JSON {
            var title = ""
            var glossList = GlossList()
            
            class GlossList:JSON {
                var glossEntry = [GlossEntry()]
                
                class GlossEntry:JSON {
                    var id = ""
                    var sortAs = ""
                    var glossTerm = ""
                    var acronym = ""
                    var abbrev = Date()
                    var glossDef = GlossDef()
                    var glossSee = ""
                    
                    class GlossDef:JSON {
                        var para = ""
                        var glossSeeAlso = [String]()
                    }
                }
                
            }
            
        }
    }
}

class AllData3:JSON {
    
    var glossary = [Glossary()]
    
    class Glossary:JSON {
        var title = ""
        var glossDiv = GlossDiv()
    }
    class GlossDiv:JSON {
        var title = ""
        var glossList = GlossList()
    }
    class GlossList:JSON {
        var glossEntry = [GlossEntry()]
    }
    class GlossEntry:JSON {
        var id = ""
        var sortAs = ""
        var glossTerm = ""
        var acronym = ""
        var abbrev = Date()
        var glossDef = GlossDef()
        var glossSee = ""
    }
    class GlossDef:JSON {
        var para = ""
        var glossSeeAlso = [String]()
    }
}

class StaticData {
    static var glossary1 = AllData()
    static var glossary2 = AllData2()
    
    static var mergedGlossaries = AllData3()
}

class OtherTypes: JSON {
    var color = UIColor()
    var date = Date()
}
///////////////////////////////////////////////////////////////////////////

let VSData = "{\"Addon\":{\"Description\":\"PleasechooseyourNanbread\",\"Aname\":\"Your Name Here\",\"Id\":\"259\",\"Icon\":\"this is the icon\",\"Limit\":\"1\",\"Specialaddon\":\"Super Special\",\"Next\":\"165\"}}"

class TheStandardWay {
    
    var addon:Addon
    
    class Addon {
        var id: Int?
        var icon: String?
        var desc: String?
        var limit: Int?
        var next: Int?
        var aname: String?
        var specialaddon: Int?
        
        init(id: Int?,icon: String?,desc: String?,limit: Int?,next: Int?,aname: String?,specialaddon: Int?){
            
            self.id = id
            self.icon = icon
            self.desc = desc
            self.limit = limit
            self.next = next
            self.aname = aname
            self.specialaddon = specialaddon
            
        }
    }
    init(){
        let addon = VSData.JSONToDictionary["Addon"] as! Dictionary<String,Any>
        self.addon = Addon(
            id: addon["Id"] as? Int,
            icon: addon["Icon"] as? String,
            desc: addon["Desc"] as? String,
            limit: addon["Limit"] as? Int,
            next: addon["Next"] as? Int,
            aname: addon["Aname"] as? String,
            specialaddon: addon["Specialaddon"] as? Int)
    }
}

class TheJSONSwiftWay:JSON {
    
    var addon = Addon()
    
    class Addon:JSON {
        var id = 0
        var icon = ""
        var desc = ""
        var limit = ""
        var next = ""
        var aname = ""
        var specialaddon = ""
    }
    required init() { // There are many ways to use the JSONSwift framework
        super.init()
        self.JSONtoClass(dict: VSData.JSONToDictionary)
        print("TheJSONSwiftWay\n",self.toJSONDict,"\n")
    }
}

class PopulateData {
    
    static var theStandardWay = TheStandardWay()
    
    static var theJSONSwiftWay = TheJSONSwiftWay()
    
    
    static func doWorkTheJSONSwiftWay() {
        self.theJSONSwiftWay.addon.desc = "JSONSwift (18 Lines of Code) - The Best, Most Versatile JSON Framework"
        print("TheJSONSwiftWay Update Desc\n",self.theJSONSwiftWay.toJSONDict,"\n")
    }
    
    static func doWorkTheStandardWay() {
        // I am using JSONToDictionary, normaly you would need to create your own JSON to Dictionary using JSONSerialization class Apple provides
        theStandardWay.addon.desc = "TheStandardWay \n The Standard Way (36 Lines of Code) - More Code, More Time, More Complex, More Unwrapping Optionals\n"

        print(theStandardWay.addon.desc!)
    }
}











