import UIKit

var str = "Hello, playground"

let value = arc4random_uniform(100);
print("--> \(value)")


// --- Tuple

let coordinates = (4, 6)

let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x: 2, y: 3)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let (x3, y3) = coordinatesNamed
x3
y3

// --- Boolean

let yes = true
let no = false

let isFourGreaterThanFive = 4 > 5

if isFourGreaterThanFive {
    print("---> True")
} else {
    print("---> False")
}

let a = 5
let b = 10

if a > b {
    print("---> a가 크다")
} else {
    print("---> b가 크다")
}

let name1 = "Jin"
let name2 = "Hong"

let isTwoNameSame = name1 == name2

if isTwoNameSame {
    print("---> same name")
} else {
    print("---> different name")
}
