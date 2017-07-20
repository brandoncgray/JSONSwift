

import Cocoa


class ViewController: NSViewController, NSTextFieldDelegate, NSTableViewDelegate {
    var employees = Employee.employees
    var index = Int()
        
    @IBOutlet weak var amount: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func refreshView() {
    }
        
    override func controlTextDidChange(_ obj: Notification) {
        let textField = obj.object as! NSTextField
        switch textField {
        case amount:
            employees[index].amount = textField.doubleValue
            Employee.employees = employees
            print(employees)
        default:
            print("default")
        }
    }
    @IBAction func rowSelected(_ sender: NSTableView) {
        index = sender.selectedRow
        amount.doubleValue = employees[index].amount
        Employee.employees = employees
        print(sender.selectedRow)
        print(Employee.employees.json)
        Employee().save()
        Employee().load()
    }
}

