//
//  ClassManager.swift
//  ExampleJSON
//
//  Created by Brandon Gray on 4/6/17.
//  Copyright © 2017 Brandon Gray. All rights reserved.
//
import JSON

let jsonDataString = "{\"Glossary\":{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":[{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"XML\"],\"Para\":\"A meta-markup language, used to create markup languages such as DocBook.\"},\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Abbrev\":\"ISO 8879:1986\",\"Acronym\":\"SGML\",\"GlossSee\":\"markup\",\"Id\":\"SGML\"},{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"HTML\"],\"Para\":\"The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks.\"},\"SortAs\":\"XML\",\"GlossTerm\":\"Extensible Markup Language\",\"Abbrev\":\"ISO xxxx:xxxx\",\"Acronym\":\"XML\",\"GlossSee\":\"markup\",\"Id\":\"XML\"}]}}}}"

let jsonArrayDataString = "[{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":[{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"XML\"],\"Para\":\"A meta-markup language, used to create markup languages such as DocBook.\"},\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Abbrev\":\"ISO 8879:1986\",\"Acronym\":\"SGML\",\"GlossSee\":\"markup\",\"Id\":\"SGML\"},{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"HTML\"],\"Para\":\"The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks.\"},\"SortAs\":\"XML\",\"GlossTerm\":\"Extensible Markup Language\",\"Abbrev\":\"ISO xxxx:xxxx\",\"Acronym\":\"XML\",\"GlossSee\":\"markup\",\"Id\":\"XML\"}]}}}]"

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
        var abbrev = ""
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
                    var abbrev = ""
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
        var abbrev = ""
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

