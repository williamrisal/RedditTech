//
//  SearchService.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 28/02/2022.
//

import Foundation

struct SearchService{
    let url = "https://oauth.reddit.com/api/subreddit_autocomplete_v2"
    var semaphore = DispatchSemaphore (value: 0)
    
    func getSearchResult(search : String) async -> SearchResults{
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var searchResult = SearchResults()
        var request = URLRequest(url: URL(string: "\(url)?&query=\(search)")!, timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let _ = data else {
            print(String(describing: error))
              self.semaphore.signal()
            return
          }
            
            if let data = data {
                
                do {
                    let decoderesponse = try? JSONDecoder().decode(SearchResults.self, from: data)
                    searchResult = decoderesponse!
                } catch {
                    print("error: ", error)
                }
            }
            self.semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return searchResult
    }
}
