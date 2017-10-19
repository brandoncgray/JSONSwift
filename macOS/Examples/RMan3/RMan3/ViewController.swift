

import Cocoa


class ViewController: NSViewController, NSTextFieldDelegate, NSTableViewDelegate {
    @objc var employees = EmployeeModel.data.employees
    var index = Int()
    @IBOutlet weak var amount: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func controlTextDidChange(_ obj: Notification) {
        let textField = obj.object as! NSTextField
        switch textField {
        case amount:
            employees[index].amount = textField.doubleValue
            print(employees)
        default:
            print("default")
        }
    }
    @IBAction func rowSelected(_ sender: NSTableView) {
        guard sender.selectedRow >= 0 else { return }
        index = sender.selectedRow
        amount.doubleValue = employees[index].amount
        EmployeeModel.data.employees = employees
        print(sender.selectedRow)
        print(EmployeeModel.data.toJSONDict)
        EmployeeModel.data.save()
    }
}

