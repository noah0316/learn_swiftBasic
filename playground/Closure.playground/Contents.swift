import UIKit

var multuplyClosure: (Int, Int) -> Int = { a, b in
    return a * b
}

let result = multuplyClosure(4, 2)

func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}


operateTwoNum(a: 4, b: 2, operation: multuplyClosure)

var addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}
operateTwoNum(a: 4, b: 2, operation: addClosure)

operateTwoNum(a: 4, b: 2) { a, b in
    return a / b
}
