//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//  Modified by Noah on 2021/01/25.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension SearchViewController: UISearchBarDelegate {

    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        dismissKeyboard()
        guard let searchTerm = searchBar.text,
            searchTerm.isEmpty == false else { return }
        // TODO: 네트워킹을 통한 검색
        // - 목표: search term을 가지고 네트워킹을 통해서 영화검색
        // - 검색 API가 필요
        // - 결과를 받아올 모델 Movie, Response
        // - 결과를 받아와서, CollectionView로 표현

        SearchAPI.search(searchTerm) { movies in
            // collectionView로 표현하기
            print(movies.count, movies.first?.title)
        }

        print("---> 검색어: \(searchTerm)")
    }
}

class SearchAPI {
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        let session = URLSession(configuration: .default)

        var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)

        let requestURL = urlComponents.url!

        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300

            guard error == nil,
                let statusCode = (response as? HTTPURLResponse)?.statusCode,
                successRange.contains(statusCode) else {
                completion([])
                return

            }

            guard let resultData = data else {
                completion([])
                return
            }

            // data -> [Movie]
            let movies = SearchAPI.parseMovies(resultData)
            completion(movies)
        }
        dataTask.resume()

    }

    static func parseMovies(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()

        do {
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies
            return movies


        } catch let error {
            print("---> parsing error: \(error.localizedDescription)")
            return []
        }
    }
}


struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}

struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String

    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
}