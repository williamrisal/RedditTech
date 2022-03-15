//
//  UserPreferencesService.swift
//  ReddiTech
//
//  Created by Anthony Luong on 27/02/2022.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
import Kanna
#endif

open class UserPreferencesService {
    var afterId = ""
    let url = "https://oauth.reddit.com"
    var semaphore = DispatchSemaphore (value: 0)

    func getUserPreferences() -> UserPreferences? {
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var userPreferencesData : UserPreferences? = nil
        var request = URLRequest(url: URL(string: "\(url)/api/v1/me/prefs")!, timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard data != nil else {
            print(String(describing: error))
              self.semaphore.signal()
            return
          }

            if let data = data {
                if let decoderesponse = try? JSONDecoder().decode(UserPreferences.self, from: data){
                    userPreferencesData = decoderesponse
                } else {
                    userPreferencesData = nil
                }
            }
            self.semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return userPreferencesData
    }

    func setUserPreferences(newUserPreferences: UserPreferences) -> UserPreferences? {
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var userPreferencesData : UserPreferences!
        var request = URLRequest(url: URL(string: "\(url)/api/v1/me/prefs")!, timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        do {
            let encodeJSON = try! JSONEncoder().encode(newUserPreferences)
            let jsonUserPreferences = String(data:encodeJSON, encoding: .utf8)
            request.httpBody = jsonUserPreferences?.data(using: .utf8)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        request.httpMethod = "PATCH"


        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard data != nil else {
            print(String(describing: error))
              self.semaphore.signal()
            return
          }

            if let data = data {
                if (try? JSONDecoder().decode(UserPreferences.self, from: data) != nil) != nil  {
                } else {
                    userPreferencesData = nil
                }
            }
            self.semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return userPreferencesData
    }
}
