
import Cocoa
import JSON

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    override init() {
        //Register online or use the test code below.
        JSONRegistration.setup(company: "Test Company", registrationIDs:
            ["210a61f6c75c2dcd0cb663281eace40c1690810422498a04f4e2ab29216199a3"]
        )
        
        
        JSONSetup.set(option: .camelcased)
        JSONSetup.set(dateFormats: ["yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd'T'HH:mm:ss.SSS"]) // 2015-05-28T15:05:56 , 2015-05-28T15:05:56.277
        //JSONSetup.set(outputDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS")
        JSONSetup.set(outputDateFormat: "yyyy-MM-dd")
        //        JSONSetup.use(unixTimestamp: true)
        
        
        // EncryptDatabase set to true will force encrypt all data
        //JSONSetup.encryptDatabase(true)
        
        // Load saved data
        EmployeeModel.data.load()

    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

