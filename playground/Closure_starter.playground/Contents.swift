import UIKit

/*
{(param) -> return type in
    statement
    ....
}
*/

// Example 1: Simple Closure

//let simpleClosure = {
//
//}
//
//simpleClosure()

// Example 2: 코드블록을 구현한 Closure

//let simpleClosure = {
//    print("Hello, 클로져!")
//}
//
//simpleClosure()

// Example 3: input parameter를 받는 Closure

//let simpleClosure:(String) -> Void = { name in
//    print("Hello, 클로져! 나의 이름은 \(name) 입니다!")
//}
//
//simpleClosure("Noah")

// Example 4: 값을 리턴하는 Closure
//
//let simpleClosure:(String) -> String = { name in
//
//    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거에요!"
//    return message
//}
//
//let result = simpleClosure("Noah")
//print(result)

// Example 5: Closure를 파라미터로 받는 함수 구현

//func someSimpleFunction(simpleClosure: () -> Void) {
//    print("함수에서 호출이 되었어요")
//    simpleClosure()
//}
//
//someSimpleFunction(simpleClosure: {
//    print("헬로 Noah from closure")
//})

// Example 6: Trailing Closure

func someSimpleFunction(message: String, simpleClosure: () -> Void) {
    print("함수에서 호출이 되었어요, 메세지는 \(message)")
    simpleClosure()
}

someSimpleFunction(message: "메시지!",simpleClosure: {
    print("헬로 Noah from closure")
})

someSimpleFunction(message: "메시지!") {
    print("헬로 Noah from closure")
}

