import UIKit

struct Lecture {
    var title: String
    var maxStudent: Int = 10
    var numOfRegistered: Int = 0
    
    func remainSeats() -> Int {
        let remainSeats = maxStudent - numOfRegistered
        return remainSeats
    }
    
    mutating func register() {
        // 등록된 학생수 증가시키기
        numOfRegistered += 1
    }
    
    static let target: String = "Anybody want to learn something"
    
    static func teacherName()-> String {
        return "Noah"
    }
}

var lec = Lecture(title: "iOS Basic")

//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeats = lec.maxStudent - lec.numOfRegistered
//    return remainSeats
//}

//remainSeats(of: lec)
lec.remainSeats()
lec.register()
lec.remainSeats()
Lecture.target
Lecture.teacherName()


struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20)

// 제곱, 반값
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    
    static func half(value: Int) -> Int {
        return value / 2
    }
}

Math.square(value: 5)
Math.half(value: 20)

var value: Int = 3

extension Int {
    func square() -> Int {
        return self * self
    }
    
    func half() ->  Int {
        return self / 2
    }
}

value.square()
value.half()
