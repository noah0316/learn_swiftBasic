import UIKit


func printName() {
    print("---> My name is Noah")
}

printName()

// param 1개
// 숫자를 받아서 10을 곱해서 출력한다.
// learned how to use external name

func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen(value: 5)

// param 2개
// 물건값과 갯수를 받아서 전체 금액을 출력하는 함수

//printTotalPrice(price: 1500, count: 5)

//func printTotalPrice(_ price: Int, _ count: Int) {
//    print("Total price: \(price * count)")
//}
//printTotalPrice(1500, 5)

//func printTotalPrice(가격 price: Int, 갯수 count: Int) {
//    print("Total price: \(price * count)")
//}
//printTotalPrice(가격:1500, 갯수:5)

func printTotalPrice(price: Int, count: Int) {
    print("Total price: \(price * count)")
}


printTotalPrice(price: 1500, count: 5)
printTotalPrice(price: 1500, count: 10)
printTotalPrice(price: 1500, count: 7)
printTotalPrice(price: 1500, count: 1)

func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {
    print("Total price: \(price * count)")
}

printTotalPriceWithDefaultValue(count: 5)
printTotalPriceWithDefaultValue(count: 10)
printTotalPriceWithDefaultValue(count: 7)
printTotalPriceWithDefaultValue(count: 1)

printTotalPriceWithDefaultValue(price: 2000, count: 1)

func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
print(calculatedPrice)

// 1. 성, 이름을 받아서 fullname을 출력하는 함수
func printFullName(firstName: String, lastName: String) {
    print("fullname is \(firstName) \(lastName)")
}

// 2. 1번에서 만든 함수를 이용해 파라미터 이름을 제거하고 fullname 출력하는 함수
// use overloading
func printFullName(_ firstName: String, _ lastName: String) {
    print("fullname is \(firstName) \(lastName)")
}

// 3. 성, 이름을 받아서 fullname return 하는 함수


func returnFullName(firstName: String, lastName: String) -> String {
    return "\(firstName) \(lastName)"
}

printFullName(firstName: "Noah", lastName: "Hong")
printFullName("Noah", "Hong")
let name = returnFullName(firstName: "Noah", lastName: "Hong")
name


// basic function syntax
//func functionName(param: ParamType) -> ReturnType {
//    // .......
//    return returnValue
//}

// overload
func printTotalPrice(price: Double, count: Double){
    print("Total price: \(price * count)")
}

// In-out parameter

var value = 3
func incrementAndPrint(_ value: inout Int){
    value += 1
    print(value)
}

incrementAndPrint(&value)

// ---- Function as as param

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(4, 2)
function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}

printResult(add, 10, 5)
printResult(subtract, 10, 5)
