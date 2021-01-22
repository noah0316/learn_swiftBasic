import UIKit

// URL

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString
url?.scheme
url?.host
url?.path
url?.query
url?.baseURL


let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)


relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL

// URLComponents

//var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
//let mediaQuery = URLQueryItem(name: "media", value: "music")
//let entityQuery = URLQueryItem(name: "entity", value: "song")
//let termQuery = URLQueryItem(name: "term", value: "지드래곤")
//
//urlComponents?.queryItems?.append(mediaQuery)
//urlComponents?.queryItems?.append(entityQuery)
//urlComponents?.queryItems?.append(termQuery)
//
//urlComponents?.url
//urlComponents?.string
//urlComponents?.queryItems


// URLSession

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
// URLComponents
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")
urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
let requestURL = urlComponents.url!

struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
        
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl100"
    }
}


let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    // 목표: 트랙리스트 object로 가져오기
    
    // TODO:
    // - Data -> Track목록으로 가져오기[Track]
    // - Track 오브젝트를 만들어야겠다.
    // - Data에서 struct로 파싱하고 싶다. > Codable 이용해서 만들자
    //  - Json 파일, 데이터 > 오브젝트 (Codable 이용)
    //  - Response, Track 두개 만들예정
    
    
    // 해야할 일
    // - Response, Track, struct
    // - struct의 프로퍼티 이름과 실제 데이터의 키와 맞추기 (Codable 디코딩하기 위해서)
    // - Decoding(파싱하기)
    // - 트랙리스트 가져오기
    
    
    // 파싱 및 트랙 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("---> tracks: \(tracks.count) -\(tracks.first?.title), \(tracks.first?.thumbnailPath)")
    } catch let error {
        print("---> error: \(error.localizedDescription)")
    }
//    print("---> result: \(resultString)")
}

dataTask.resume()
