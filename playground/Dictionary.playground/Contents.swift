import UIKit

var scoreDic: [String: Int] = ["Noah": 85, "Jake": 90, "Jason": 85]
//var scoreDic: Dictionary<String, Int> = ["Noah": 85, "Jake": 90, "Jason": 85]

if let score = scoreDic["Noah"] {
    print(score)
} else {
    // score 없음
}

// nil
//scoreDic["Hong"]

//scoreDic = [:]
scoreDic.isEmpty
scoreDic.count

// 기존 사용자 업데이트
scoreDic["Noah"] = 99
scoreDic

// 사용자 추가
scoreDic["Jack"] = 100
scoreDic

// 사용자 제거
scoreDic["Jack"] = nil
scoreDic

// for Loop
for (name, score) in scoreDic {
    print("\(name), \(score)")
}

for key in scoreDic.keys {
    print(key)
}

var personalInfo: [String: String] = ["name" : "Noah", "job" : "iOS Engineer", "city" : "seoul"]
personalInfo["city"] = "sydney"

func printNameAndCity(dic: [String: String]){
    if let name = dic["name"], let city = dic["city"] {
        print("name: \(name), city: \(city)")
    } else {
        print("---> cannot find")
    }
}

printNameAndCity(dic: personalInfo)

