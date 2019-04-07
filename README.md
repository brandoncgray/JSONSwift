# [JSONSWIFT](http://www.jsonswift.com) - A JSON Framework for Swift
###### Developed by: Brandon Gray @ Perfect Reality Apps, LLC
![iOS](https://img.shields.io/badge/iOS-Supported-brightgreen.svg)
![macOS](https://img.shields.io/badge/macOS-Supported-brightgreen.svg)  
![Swift](http://img.shields.io/badge/swift-4.2-brightgreen.svg) 
![Swift](http://img.shields.io/badge/swift-4.1-brightgreen.svg)
![Swift](http://img.shields.io/badge/swift-4.0.2-brightgreen.svg)
![Swift](http://img.shields.io/badge/swift-4.0-brightgreen.svg)
![Swift](http://img.shields.io/badge/swift-3.1-brightgreen.svg)  
![macOS](https://img.shields.io/badge/macOS-10.13-brightgreen.svg)
![macOS](https://img.shields.io/badge/macOS-10.12-brightgreen.svg)

<!--[![Slack Status](http://vapor.team/badge.svg)](http://slack.qutheory.io)-->
[![Twitter Follow](https://img.shields.io/twitter/follow/espadrine.svg?style=social&label=Follow)](http://www.twitter.com/PerfectRealityA)

### This repository contains the framework and example projects.

## What is JSONSwift

**JSONSwift framework is the most complete JSON framework for Swift currently available. It provides a simple way to convert JSON data to and from a Swift Class with ease and persist data effortlessly.**

I made JSONSwift because I hate parsing JSON dictionaries into class properties and then mapping the data to a database like SQLite or even Realm.io. It is far more efficient to access the properties of an instance using dot syntax to organize and find information in class objects and persist the data when needed without loads of work. Because of this, JSONSwift was born. The convenience of JSONSwift is that it does this work for you! All you need to do is create the class to match the data and add the data to the JSONSwift class function, and that is it!

JSONSwift makes life easy on developers; complex JSON data is not fun to parse or persist.

## JSONSwift

* **Maps JSON from String or Data to a Class**  
* **Convert a Class or Struct to JSON as String or Data**
* No more converting JSON (Data or String types) to dictionaries or arrays
* No more "for loops" to assign dictionaries values to class properties
* No more populating dictionaries from classes and converting it to JSON (Data or String types)
* Handles all the JSON data types
* Converts date string to Swift Date type - to and from class
* Custom Date formats for both importing and exporting to and from String
* Converts UNIX timestamps to Date
* Converts hexadecimal string to Swift UIColor type - to and from class
* Converts Array or Dictionary types into JSON as Data or String types
* Option to exclude nested Classes, Structs, and properties (let or var) from JSON protocol
* Single out properties with non conforming naming conventions
* Combine multiple JSON (Data or String types) into an array `Array<YourClass>`
* Use `Map`, `Filter`, `Reduce`, `FlatMap`, `ForEach`, and custom functions; just like any normal array containing class objects!
* Ignores JSON data not included as class properties
* No optionals, no unwrapping!
* Superclasses and Subclasses supported

All these features make it easy to handle simple and complex data coming from a restful service. I personally am tired of seeing dictionaries being used instead of classes, this is lazy. This is usually because developers don't want to take the time to write 1000+ lines in their class model (`self.userName = dict["username"]`) over and over, or they don't know OOP.

```swift    
let allData = AllData()
allData.JSONtoClass(jsonString: jsonDataString)

```

## JSONSwift Database
### Save & Load
Easily save data for any class the has the superclass `JSON` and just as easily load data. 

```swift
let allData = AllData()
allData.save()
allData.load()      
```
### Encrypt Data
```swift
allData.save(encrypt: true)
```

## Notice!
> ### I am currently in the process of making the JSONSwift website, the links to www.JSONSwift.com are not active, however, you can still download and try out JSONSwift! If you need a registration key you can email me at noreply@jsonswift.com; send me your company name (what the AppStore uses) and you app's bundleID and I will create a key for you.

## Documentation

For reference, JSONSwift's documentation is located in the JSON.h header file in the framework and here in this README.md file.

<!--## Community

Join the welcoming community of fellow JSONSwift framework developers in [slack]().-->

## Contributing

To contribute a **feature or idea** to JSONSwift, contact us through the [JSONSwift.com](http://www.jsonswift.com/contact) website.

If you find a **bug**, please submit a pull request with a failing test case displaying the bug or create an issue.

## Getting Started
Download the JSONSwift zip from [here](http://www.jsonswift.com/download)

### In Project Directory

2. Add the JSONSwift.Framework file to your project
3. Add it as an embedded binary.

### In Your Xcode Project

> Importing JSON now would give an error: missing CommonCrypto module...

To make the CommonCrypto module visible to Xcode there are two options:  

 1. Easy: Generate the CommonCrypto.framework in SDK

 > This is the easies way to add the CommonCrypto.framework to the SDK, every time you update Xcode you will need to run this script again
 
 2. Expert: Generate a local CommonCrypto module map

 > This is a different way to get the CommonCrypto.framework working, if you can't get option 1 working then use this method. This is more customizable (Expert Level).    

### Setting Up JSONSwift

JSONSwift uses the CommonCrypto library and Swift does not include it as a framework. So first we need to make Swift use it!   

1. Determine the iPhone Simulator SDK version example output: -SDKs iphonesimulator10.1  
`xcodebuild -showsdks`

2. Go to the GenerateCommonCryptoModule script directory.  
Type `cd ` and drag the folder you downloaded into your open Terminal window. Then hit return.

3. Choose one of the methods below **1** or **2** to add CommonCrypto.framework

> Don't forget to make the file executable! `chmod +x <file path to GenerateCommonCryptoModule>`  
The script depends on xcrun to find the SDK directory

#### Step 1: Playground & Simulator
This will allow you to run CommonCrypto in the Simulator and Playground... not Archives for iOS Devices

##### Development Mac
> If using macOS `sudo ./GenerateCommonCryptoModule macosx10.13` remember to check the version on macOS you are running

`sudo ./GenerateCommonCryptoModule iphonesimulator`

#### Step 2: Module Map 
This will allow you to run CommonCrypto in the Simulator and iOS Device only, not Playground
  

##### Development Mac
> If using macOS `sudo ./GenerateCommonCryptoModule macosx10.13 .` remember to check the version on macOS you are running

1. Change the version number where the "X" is in the second step, use the version number you got from running `xcodebuild -showsdks`  
2. Notice the solo period “.” after the `iphonesimulator10.X`? That period is required.
3. Run the script  
`./GenerateCommonCryptoModule iphonesimulatorXX.X .` Don't forget to replace the "X"
4. Once the script is run you will see a folder called CommonCrypto and it will contain a module.map file
5. Copy the file to your Xcode project folder (same location as the Xcode project file)

##### In Xcode
* Go to **Build Settings, Swift Compiler – Search Paths** and set **Import Paths** to point to the directory that contains the module.map. If you put the file in the location described above, use: `$(SRCROOT)`
* If you are using a build server then add a second import path: `/Users/$(USER)/Documents/XcodeHelpers`

##### Build Server
1. Make this directory `mkdir /Users/xcodeserver/Documents/XcodeHelpers`
1. `cd /Users/xcodeserver/Documents/XcodeHelpers/`
2. Copy GenerateCommonCryptoModule script and paste it into /Users/xcodeserver/Documents/XcodeHelpers/ 
2. Run the script in terminal  
`./GenerateCommonCryptoModule iphonesimulatorXX.X .` Don't forget to replace the "X"

> It is not required to use the same method on development and build server. 

**Done! Next is the code!**

### In the AppDelegate

* Import the JSONSwift Framework  

```swift
import JSON
```
> macOS apps will need to override the appDelegate's init() and place the code below in it.

```swift macOS
// Only macOS apps need to do this
override init() {
	// code here
}
```

* Set JSONSetup to match the JSON Naming Convention, to allow JSON.Framework to map the class properties.

```swift
JSONSetup.set(option: .titlecased) 
```
>This should match the data coming from the service you are calling.
>Naming Conventions Supported:  

>* camelCase
>* TitleCase
>* snake_case
>* lowercase
>* kebab-cased

#### Registering JSONSwift
* Set up the JSON [Registration](http://www.jsonswift.com/create) using your company and bundle id.
* Use the code below, replacing your "Test Company" with your company name and adding your registration ids to the String Array.

>Register online or use the test code below, be sure to set the bundle id to `com.test.debug` for the test code below.

```swift
JSONRegistration.setup(company: "Test Company", registrationIDs:
            ["210a61f6c75c2dcd0cb663281eace40c1690810422498a04f4e2ab29216199a3"]
        )
```
```swift
JSONSetup.set(option: .titlecased) 
```

#### Date Formats
* Set date formats that the JSON data is formatted to.
* Multiple Formats are supported

```swift
JSONSetup.set(option: .titlecased) 
JSONSetup.set(dateFormats: ["yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd'T'HH:mm:ss.SSS"]) // 2015-05-28T15:05:56.277 ,"yyyy-MM-dd'T'HH:mm:ss"
```

* Or use the default date format

```swift
JSONSetup.setDefaultDateFormat() // "yyyy-MM-dd HH:mm:ss Z"
```

* Set date format to output JSON.

```swift
JSONSetup.set(outputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS")
```

* If you need to send UNIX timestamp to a server

```swift
JSONSetup.use(unixTimestamp: true)
```
* The problem with UNIX timestamps are that they are not human readable. If you have a UNIX timestamp in your JSON, it will be automatically converted to a string date format ("yyyy-MM-dd HH:mm:ss Z"), but if you need to send a UNIX timestamp to a server that requires a UNIX timestamp and won't except a string format then use the code above.

* If UNIX timestamp is required but you need a string date for a UILabel you have two options.

	1. Convert the date when you want to use it. It will use whatever output date you have set. 
 
		```swift
	allData.myDate.convertToString
	//2014-11-10
	```
	2. Set the unixTimestamp to true then false
	
		```swift
	JSONSetup.use(unixTimestamp: true)
	let jsonSendData = allData.toDict
	JSONSetup.use(unixTimestamp: false)
	```
	
### Appstore

You will need to run this build script, it loops through the frameworks embedded in the application and removes unused architectures.

```swift
# This script loops through the frameworks embedded in the application and
# removes unused architectures.
find "$APP_PATH" -name '*.framework' -type d | while read -r FRAMEWORK
do
FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
echo "Executable is $FRAMEWORK_EXECUTABLE_PATH"

EXTRACTED_ARCHS=()

for ARCH in $ARCHS
do
echo "Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"
lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
done

echo "Merging extracted architectures: ${ARCHS}"
lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
rm "${EXTRACTED_ARCHS[@]}"

echo "Replacing original executable with thinned version"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"

done

```

### Errors

If you run into a code signing issue use the **--deep** flag in the **Signing** section of your projects build settings section
> I havent had to do this with iOS but I do have to do it with macOS, you may need to do it with iOS if the AppStore has an issue with it.

```
//:configuration = Debug
OTHER_CODE_SIGN_FLAGS = --deep

//:configuration = Release
OTHER_CODE_SIGN_FLAGS = --deep
```

	
---
### Creating a Model
Creating a model is as simple as creating a class and adding JSON as the superclass.  

```swift
class myClass:JSON {}
```

#### Example Classes

##### Simple Class
>The base class does not have to be a subclass of the JSON class, nested classes can contain the JSON super class.

* This class is based on the JSON from the [json.org](http://json.org/example.html) example. An example of this is in the ExampleJSON & ExampleJSONmacOS Xcode project.

```swift
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
        var glossEntry = [GlossEntry()] // This is how arrays are setup
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
```
>These classes don't have to be nested in the AllData class



* Another way to set up a class is by nesting every class to mimic the JSON structure.

```swift
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
```
<br>
 **Populating the class object is easy!**  
Here is a string with JSON formatted data, I have changed it to use the TitleCase naming convention.

>There is an example of the original JSON from [json.org](http://json.org/example.html) example in the ExampleJSON Xcode project. It shows how to handle mixed naming conventions.

```swift
let jsonDataString = "{\"Glossary\":{\"Title\":\"example glossary\",\"GlossDiv\":{\"Title\":\"S\",\"GlossList\":{\"GlossEntry\":[{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"XML\"],\"Para\":\"A meta-markup language, used to create markup languages such as DocBook.\"},\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Abbrev\":\"ISO 8879:1986\",\"Acronym\":\"SGML\",\"GlossSee\":\"markup\",\"Id\":\"SGML\"},{\"GlossDef\":{\"GlossSeeAlso\":[\"GML\",\"HTML\"],\"Para\":\"The XML standard is a flexible way to create information formats and electronically share structured data via the public Internet, as well as via corporate networks.\"},\"SortAs\":\"XML\",\"GlossTerm\":\"Extensible Markup Language\",\"Abbrev\":\"ISO xxxx:xxxx\",\"Acronym\":\"XML\",\"GlossSee\":\"markup\",\"Id\":\"XML\"}]}}}}"
```

* Instantiate the class.  
Populate instance with a dictionary, converting the JSON string to a dictionary
  
```swift    
let allData = AllData()
        
allData.JSONToClass(jsonString: jsonDataString)

print("Convert class to JSON dictionary as String:\n",
              allData.toJSONDict,
              "\n")
```


---
## Full Example
This is what is found in the JSON.h file in JSON.Framework

>This shows examples of every feature

```swift
class SomeClass {
    
    static var dataObject = SomeClass.AllData()
    static var dataWithSuperClassObject = SomeClass.Person()
    
    // Structs can be converted to JSON but not written to from JSON. Use JSONProtocol to the struct and use it outside of the class.
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
        
        var tests8 = object(notUsed1: 100, notUsed2: "String", notUsed3: false) //Because the struct uses the nonJSON protocol it is omitted
        
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
SomeClass.dataObject.JSONtoClass(jsonString: userJson)
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



```
