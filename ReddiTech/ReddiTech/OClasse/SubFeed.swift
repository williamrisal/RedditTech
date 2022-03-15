//
//  SubFeed.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 08/03/2022.
//

import Foundation
import Combine

class SubFeed : ObservableObject {
    @Published var subList = [MineChild]()
    
    var cancellable : Set<AnyCancellable> = Set()
    var afterId = ""
    var isFull = false
    
    var oneTime = false
    
    let url = "https://oauth.reddit.com/subreddits/mine/subscriber?limit=10"
    
    init(){
        fetchSub()
    }
    
    func fetchSub(){
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var _ : MineSub? = nil
        self.oneTime = false
        if(afterId != "stop"){
            var request = URLRequest(url: URL(string: "\(url)\(afterId.isEmpty ? "" : "&after=\(afterId)")")!, timeoutInterval: Double.infinity)
            request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
            request.httpMethod = "GET"
            
            URLSession.shared.dataTaskPublisher(for: request)
                .map { $0.data }
                           .decode(type: MineSub.self, decoder: JSONDecoder())
                           .eraseToAnyPublisher()
                           .receive(on: DispatchQueue.main)
                         .sink(receiveCompletion: { completion in
                              
                          }) { sub in
                              if(self.oneTime == false){
                                  self.subList.append(contentsOf: sub.data?.children ?? [])
                                  self.afterId = sub.data?.after ?? "stop"

                                  if (sub.data?.children!.count)! < 10 {
                                      self.isFull = true
                                  }
                                  
                                  self.oneTime = true
                              }
                       }
                       .store(in: &cancellable)
            
            if(!subList.isEmpty){
            
            }
        }
    }
}
