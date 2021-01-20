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
    print("---> result: \(resultString)")
}

dataTask.resume()
