import UIKit

// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 Array와 강사이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기

// CustomStringCovertible 
struct Lecture: CustomStringConvertible {
    var description: String {
        return "Title: \(title), Instructor: \(instructor)"
    }
    
    let title: String
    let instructor: String
    let numOfStudent: Int
}

func printLectureTitle(Lectures: [Lecture], from instructor: String) -> Void {
    var lectureTitle = ""
    for Lecture in Lectures {
        if(Lecture.instructor == instructor) {
            lectureTitle = Lecture.title
        }
    }

    if (lectureTitle.count == 0) {
        print("\(instructor)선생님의 강의는 준비중입니다.")
    } else {
        print("\(instructor)선생님의 강의는 \(lectureTitle)입니다.")
    }

// --- Closure
//    let lectureTitle = Lectures.first { (lec) -> Bool in return lec.instructor == instructor}?.title ?? ""
//    print("\(instructor)선생님의 강의는 \(lectureTitle)입니다.")
}

let Lecture1 = Lecture(title: "React", instructor: "Noah", numOfStudent: 300)
let Lecture2 = Lecture(title: "Swift", instructor: "Jason", numOfStudent: 300)
let Lecture3 = Lecture(title: "Flutter", instructor: "Jim", numOfStudent: 300)

let Lectures = [Lecture1, Lecture2, Lecture3]

printLectureTitle(Lectures: Lectures, from: "Noah")
print(Lecture1)
