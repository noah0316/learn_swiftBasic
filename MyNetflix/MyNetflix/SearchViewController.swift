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
        // 네트워킹을 통한 검색
        // - 목표: search term을 가지고 네트워킹을 통해서 영화검색
        // - 검색 API가 필요
        // - 결과를 받아올 모델 Movie,Response
        // - 결과를 받아와서, CollectionView로 표현
        
        SearchAPI.search(searchTerm) { movies in
            // collectionView로 표현하기
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
            let string = String(data: resultData, encoding: .utf8)
            print("---> result:\(string)")
//            completion([Movie])
        }
        dataTask.resume()
            
        }
    }


struct Response {
    
}

struct Movie {
    
}
