import UIKit
import Foundation

// ---- While

print("--- While")
var i = 0
while i < 10 {
    print(i)
    
    if i == 5 {
        break
    }
    
    i += 1
}

print("--- Repeat")
i = 0
repeat {
    print(i)
    i += 1
} while i < 10


// while
// Condition check > Code execution > Condition check > Code execution
//
//repeat while
// Code execution > Condition check > Code execution > Condition check



// ---- For Loop

let closedRange = 0...10 // 0~10
let halfClosedRange = 0..<10 // 0~9

var sum = 0
for i in halfClosedRange {
    print("---> \(i)")
    sum += i
}

print("---> total sum: \(sum)")

var sinValue: CGFloat = 0
for i in closedRange{
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "Noah"
for _ in closedRange {
    print("---> name: \(name)")
}

for i in closedRange {
    if i % 2 == 0 {
        print("---> 짝수: \(i)")
    }
}

for i in closedRange where i % 2 == 0 {
    print("---> 짝수: \(i)")
}

for i in closedRange {
    if i == 3 {
        continue
    }
    
    print("---> \(i)")
}

for i in closedRange {
    for j in closedRange {
        print("gugu -> \(i) * \(j) = \(i*j)")
    }
}
