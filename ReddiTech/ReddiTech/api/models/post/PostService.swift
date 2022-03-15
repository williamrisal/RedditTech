//
//  PostService.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 20/02/2022.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
import Kanna
#endif

open class PostService {
    var afterId = ""
    let url = "https://oauth.reddit.com/"
    var semaphore = DispatchSemaphore (value: 0)
    
    func getPosts(type: String) -> PostPreview? {
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var postData : PostPreview? = nil
        var request = URLRequest(url: URL(string: "\(url)\(type)?&limit=10\(afterId.isEmpty ? "" : "&after=\(afterId)")")!, timeoutInterval: Double.infinity)
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
                    let decoderesponse = try? JSONDecoder().decode(PostPreview.self, from: data)
                    postData = decoderesponse
                    self.afterId = (decoderesponse?.data.after) != nil ? (decoderesponse?.data.after) as! String : ""
                } catch {
                    print("error: ", error)
                }
            }
            
            self.semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return postData
    }
}
