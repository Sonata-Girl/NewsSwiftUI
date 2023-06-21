//
//  NetworkManager.swift
//  NewsSwiftUI
//
//  Created by Sonata Girl on 21.06.2023.
//

import Foundation

class NetworkManager: ObservableObject {
    
    // наблюдаемый объект может аблюдаться обсервером ObservedObject
    // при его использовании нужно использовать главный поток  DispatchQueue.main.async {
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
