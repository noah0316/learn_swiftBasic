import UIKit

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
