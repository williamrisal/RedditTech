//
//  SubscribeService.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 01/03/2022.
//

import Foundation

struct SubscribeService {
    
    
    func sub(name : String){
        let semaphore = DispatchSemaphore (value: 0)
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String

        var request = URLRequest(url: URL(string: "https://oauth.reddit.com/api/subscribe?action=sub&sr_name=\(name)")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func unsub(name : String){
        let semaphore = DispatchSemaphore (value: 0)
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String

        var request = URLRequest(url: URL(string: "https://oauth.reddit.com/api/subscribe?action=unsub&sr_name=\(name)")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
