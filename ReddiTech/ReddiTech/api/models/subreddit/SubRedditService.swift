//
//  SubredditService.swift
//  ReddiTech
//
//  Created by Anthony Luong on 27/02/2022.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
import Kanna
#endif

open class SubRedditService {
    var afterId = ""
    let url = "https://oauth.reddit.com/r/"
    var semaphore = DispatchSemaphore (value: 0)
    
    func getSubredditAbout(subreddit: String) -> SubRedditAbout? {
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var subRedditAboutData = SubRedditAbout()
        var request = URLRequest(url: URL(string: "\(url)\(subreddit)/about")!, timeoutInterval: Double.infinity)
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
                    let decoderesponse = try? JSONDecoder().decode(SubRedditAbout.self, from: data)
                    subRedditAboutData = decoderesponse!
                    } catch {
                    print("error: ", error)
                }
            }
            
            self.semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return subRedditAboutData
    }
}
