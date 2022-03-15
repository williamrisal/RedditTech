//
//  PostFeed.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 01/03/2022.
//

import Foundation
import Combine

class PostFeedBySubreddit : ObservableObject {
    @Published var postList = [Post]()
    
    var cancellable : Set<AnyCancellable> = Set()
    var afterId = ""
    var type = ""
    var isFull = false
    var name : String
    
    var oneTime = false
    
    let url = "https://oauth.reddit.com/r/"
    
    init(type: String, name: String){
        self.type = type
        self.name = name
        fetchPost()
    }
    
    func fetchPost(){
        let utils = utils()
        let token = utils.getDefault(key: "token") as? String
        var _ : PostPreview? = nil
        self.oneTime = false
        var request = URLRequest(url: URL(string: "\(url)\(self.name)/\(self.type)?&limit=10\(afterId.isEmpty ? "" : "&after=\(afterId)")")!, timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
                       .decode(type: PostPreview.self, decoder: JSONDecoder())
                       .eraseToAnyPublisher()
                       .receive(on: DispatchQueue.main)
                     .sink(receiveCompletion: { completion in
                          
                      }) { post in
                          if(self.oneTime == false){
                              self.postList.append(contentsOf: post.data.children)
                              self.afterId = post.data.after

                              if post.data.children.count < 10 {
                                  self.isFull = true
                              }
                              
                              self.oneTime = true
                          }
                   }
                   .store(in: &cancellable)
        
        if(!postList.isEmpty){
        
        }
    }
    
}
