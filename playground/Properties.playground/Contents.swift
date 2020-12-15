import UIKit

struct Person {
    
    // Stored Properties
    var firstName: String {
        willSet {
            print("willSet: \(firstName) --> \(newValue)")
        }
        
        didSet {
            print("didSet: \(oldValue) --> \(firstName)")
        }
    }
    var lastName: String
    
    // lazy stored property
    lazy var isSeungHyun_Hong: Bool = {
        if fullName == "SeungHyun Hong" {
            return true
        } else {
            return false
        }
    }()
    
    // Computed Property
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
            
        }
        
        set {
            // newValue = "SeungHyun Hong"
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    
    // Type Property
    static let isAlien: Bool = false
}

var person = Person(firstName: "Noah", lastName: "Hong")

person.firstName
person.lastName

person.firstName = "Jim"
person.lastName = "Kim"

person.firstName
person.lastName

person.fullName = "SeungHyun Hong"
person.fullName

Person.isAlien

person.isSeungHyun_Hong
