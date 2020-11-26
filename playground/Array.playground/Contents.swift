import UIKit

//let evenNumbers: [Int] = [2, 4, 6, 8]
var evenNumbers: Array<Int> = [2, 4, 6, 8]

evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])

let isEmpty = evenNumbers.isEmpty
evenNumbers.count

// firstItem is a Int Optional value
//let firstItem = evenNumbers.first
let lastItem = evenNumbers.last

if let firstElement = evenNumbers.first {
    print("---> first item is: \(firstElement)")
}

// return Int Optional value
evenNumbers.min()
evenNumbers.max()

var firstItem = evenNumbers[0]
var secondItem = evenNumbers[1]
var tenthItem = evenNumbers[9]

// Index Out of Range
//var twentith = evenNumbers[19]

0...3
var firstThree = evenNumbers[0...2]

evenNumbers.contains(3)
evenNumbers.contains(4)

evenNumbers.insert(22, at: 10)
//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers

evenNumbers[0] = 2
evenNumbers[0...2] = [20, 40, 60]
evenNumbers.swapAt(0, 1)

for num in evenNumbers {
    print(num)
}

for (index, num) in evenNumbers.enumerated() {
    print("idx: \(index) value: \(num)")
}

let firstThreeRemoved = evenNumbers.dropFirst(3)
evenNumbers

let lastRemoved = evenNumbers.dropLast(1)
evenNumbers

firstThree = evenNumbers.prefix(3)
evenNumbers

let lastThree = evenNumbers.suffix(3)
evenNumbers
