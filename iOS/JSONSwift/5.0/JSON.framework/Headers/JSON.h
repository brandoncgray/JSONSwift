//
//  JSON.h
//  JSON
//
//  Created by Brandon Gray on 10/7/16.
//  Copyright © 2016 Brandon Gray. All rights reserved.
//
#include "TargetConditionals.h"

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#define TARGET_OS_OSX 1
#import <Cocoa/Cocoa.h>
#endif

//! Project version number for JSON.
FOUNDATION_EXPORT double JSONVersionNumber;

//! Project version string for JSON.
FOUNDATION_EXPORT const unsigned char JSONVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <JSON/PublicHeader.h>

/*
 
//In appDelegate 

 JSONRegistration.setup(company: "Test Company", registrationIDs:
 ["c3d4fc2d45cc3874265acedfd0c7057ee7939cf0719e32bc72a31abc8b3a1e5b"]
 )
// Set JSONSetup to conform the JSON coming from the service, to allow the JSON to map the class properties
JSONSetup.set(option: .titlecased)

//Set your own date format
JSONSetup.set(dateFormats: ["yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd'T'HH:mm:ss.SSS"]) // 2015-05-28T15:05:56.277 ,"yyyy-MM-dd'T'HH:mm:ss"
JSONSetup.set(outputDateFormat: "yyyy")
//or use the default date format
//JSONSetup.setDefaultDateFormat() // "yyyy-MM-dd HH:mm:ss Z"
//Example Class - Note:The base class does not have to be a subclass of the JSON class
class SomeClass {
    
    static var dataObject = SomeClass.AllData()
    static var dataWithSuperClassObject = SomeClass.Person()
    
    // Structs can be converted to JSON but not writen to from JSON. Use JSONProtocol to the struct and use it outside of the class.
    struct object:nonJSON {
        var notUsed1:Int
        var notUsed2:String
        var notUsed3:Bool
    }
    
    // Nest Classes
    class AllData:JSON {
        var users       = [Users()]         //One object must be added to the array in order to cast the type when updating the object
        var otherStuff  = [OtherStuff()]    //One object must be added to the array in order to cast the type when updating the object
        
    }
    class Users:JSON {
        var firstName   = ""
        var lastName    = ""
        var id          = ""
        var otherStuff1  = OtherStuff1()
    }
    class OtherStuff1:JSON {
        var tests1      = 0
        var tests3      = Bool()
        var tests7:Date = Date()
        var tests6:UIColor  = UIColor.clear
    }
    class OtherStuff:JSON {
        var tests1          = 0
        var tests2          = ""
        var tests3          = Bool()
        var tests4          = 0.0
        var tests5:Float64  = 0.0
        var tests6:UIColor  = UIColor.clear
        var tests7:Date     = Date()
        
        var tests8 = object(notUsed1: 100, notUsed2: "String", notUsed3: false) //Because the struct uses the nonJSON protocol it is omited
        
        var tests9 = [String]()
        
        var omitMe1          = 0
        var omitMe2          = ""
        
        required init() {
            super.init()
            
            //Omit selected properties
            JSONOmit.set(theClass:self, param: ["omitMe1","omitMe2"])
            
        }
        
    }
    // SuperClasses
    class SuperClass:JSON {
        var group = "Male"
        var arms = 2
        var hair = "Brown"
        var cloths = Cloths()
    }
    // SubClasses
    class Person:SuperClass {
        var name = "Brandon"
    }
    class Cloths:JSON {
        var shirt = true
        var pants = true
        var shorts = false
    }
    
}

//Dictionary converted to string - similar to what comes from restful service
let userJson = (
                ["Users": [
                           ["LastName": "Gray", "FirstName": "Brandon", "Id": "1","OtherStuff1" : ["Tests1":3333,"Tests2":"this is a test 4","Tests7":"2017-09-08T00:00:00","Tests6":"#2c3a47","Tests3":true,"Tests4":33,"Tests5":333]],
                           [ "LastName": "Duff", "FirstName": "Joe", "Id": "10","OtherStuff1" : ["Tests1":3333,"Tests2":"this is a test 4","Tests7":"05-28T15:05:56.277","Tests6":"#2c3a47","Tests3":true,"Tests4":33,"Tests5":333]]]] as [String : Any]).json

let otherUserJson1 = ([
                       ["Tests1":202002,"Tests2":"this is a test 2","Tests7":"2014-05-28T15:05:56.277","Tests6":"#2c3a47","Tests3":true,"Tests4":23223,"Tests5":323232],
                       ["Tests1":202002,"Tests2":"this is a test 2","Tests7":"2015-05-28T15:05:56.277","Tests6":"#2c3a47","Tests3":true,"Tests4":23223,"Tests5":323232,"Tests9":[false,true,"Item in array",200,"3",285.5454]]]
                      ).json
let otherUserJson2 = ([["Tests1":3333,"Tests2":"this is a test 4","Tests7":"2015-05-28T15:05:56.277","Tests6":"#2c3a47","Tests3":true,"Tests4":33,"Tests5":333]]
                      ).json
let superClassJson = (["Group": "none", "Arms": 0, "Name": "none", "Hair": "n/a", "Cloths": ["Pants": false, "Shorts": true, "Shirt": false]]).json
//Convert the JSON string to Dictionary
let jsonDict = userJson.JSONToDictionary
//or to Array
let jsonArray = otherUserJson1.JSONToArray

//Use JSONtoClass to populate properties from a dictionary
SomeClass.dataObject.JSONtoClass(jsonString: jsonDict)
//Use JSONtoClass to populate properties from a array
SomeClass.dataObject.JSONtoClass(propertyName:"otherStuff", array:jsonArray)

//Use Filter to get objects with dot syntax
let filteredResults1 = SomeClass.dataObject.users.filter{ $0.firstName == "Joe" }.first
dump(filteredResults1)

//Use Filter to get objects with key value coding
let filteredResults2 = SomeClass.dataObject.users.filter({($0["firstName"] as! String) == "Brandon"}).first
dump(filteredResults2)

//Use Map to create arrays from objects
var nameArray1  = SomeClass.dataObject.users.map({"\($0.firstName)"})
var idArray     = SomeClass.dataObject.users.map({$0.id})

//Use Sort to sort object arrays to an array
//Use < or > depending on ASC or DESC
let nameArray2 = SomeClass.dataObject.users.sorted { $0.lastName < $1.lastName }

//If you want to modify the object array itself
SomeClass.dataObject.users.sort { $0.lastName > $1.lastName }

print(nameArray2.first?.lastName ?? "", nameArray2.last?.lastName ?? "")
print(SomeClass.dataObject.users.first?.lastName ?? "",SomeClass.dataObject.users.last?.lastName ?? "","\n")
print("JSON Dictionary:",SomeClass.dataObject.toJSONDict,"\n")
print("JSON Array Dictionary:",SomeClass.dataObject.toJSONArrayDict,"\n")
print("JSON Array:",SomeClass.dataObject.toJSONArray,"\n")


//Combine Arrays together
//Method #1

//Combine the arrays together
let mergedArray = otherUserJson1.JSONToArray.combine(array: otherUserJson2.JSONToArray)
SomeClass.dataObject.JSONtoClass(propertyName:"otherStuff", array:mergedArray)  as! SomeClass.AllData

//Method #2
//Get existing data array from the object
let oldData = SomeClass.dataObject.otherStuff.convertToJSONOption

//Combine the arrays together
let mergedData = oldData.combine(array: otherUserJson2.JSONToArray)
//Use JSONtoClass to populate properties from the new appended array
SomeClass.dataObject.JSONtoClass(propertyName:"otherStuff", array:mergedData)  as! SomeClass.AllData

print("JSON Dictionary:",SomeClass.dataObject.toJSONDict,"\n")
print("JSON Array Dictionary:",SomeClass.dataObject.toJSONArrayDict,"\n")
print("JSON Array:",SomeClass.dataObject.toJSONArray,"\n")

print(SomeClass.dataObject.users.first?.otherStuff1.tests7 ?? "nil")
print(SomeClass.dataObject.users.first?.otherStuff1.tests6 ?? "nil")

print("Super Class        :",SomeClass.dataWithSuperClassObject.toDict)
// Change the JSON and the Super Class updates
SomeClass.dataWithSuperClassObject.JSONtoClass(dict: superClassJson.JSONToDictionary)
print("Super Class Changed: ",SomeClass.dataWithSuperClassObject.toDict)

dump(SomeClass.dataObject)

Optionals are not supported
*/

