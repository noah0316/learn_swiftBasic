import UIKit

var carName: String? = "Tesla"
carName = nil
carName = "Tesla"

var favoriteMovieStar: String? = nil
let num = Int("10") // Int Optional







// Forced unwrapping
//print(carName!)


// Optional binding(if let)
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name이 없습니다.")
}

// Optional binding(if let)
//func printParsedInt(from: String) {
//    //Cyclomatic Complexity
//    if let parsedInt = Int(from) {
//        print(parsedInt)
//    } else {
//        print("Int로 converting 되지 않았습니다.")
//    }
//}

//printParsedInt(from: "100")
//printParsedInt(from: "헬로우 마이네임이즈")

// Optional binding(guard)
func printParsedInt(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 되지 않습니다.")
        return
    }
    print(parsedInt)
}
printParsedInt(from: "100")

// Nil coalescing
carName = nil
let myCarName: String = carName ?? "모델 S"
