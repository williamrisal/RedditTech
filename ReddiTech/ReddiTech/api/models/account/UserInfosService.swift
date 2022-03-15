//
//  UserInfosService.swift
//  ReddiTech
//
//  Created by Anthony Luong on 08/03/2022.
//

import Foundation

open class UserInfosService {
    var afterId = ""
    let url = "https://oauth.reddit.com/api/v1/me"
    var semaphore = DispatchSemaphore (value: 0)
    
    func getUserInfos() -> UserInfos? {
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var getUserInfosData = UserInfos()
        
        var request = URLRequest(url: URL(string: "\(url)")!, timeoutInterval: Double.infinity)
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
                    let decoderesponse = try? JSONDecoder().decode(UserInfos.self, from: data)
                    getUserInfosData = decoderesponse!
                    } catch {
                    print("error: ", error)
                }
            }
            
            self.semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return getUserInfosData
    }
}
