//
//  PostPreviewDattaClass.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 01/03/2022.
//

import Foundation
import Combine

class PostPreviewDattaClass: ObservableObject{
    @Published var postData = [Post]()
    var postService = PostService()
    
    var postListIsFull = false
    
    var afterId = ""
    var currentPage = 0
    
    let url = "https://oauth.reddit.com/"
    
    private var cancellable: AnyCancellable?
    
    func fetchPostData(type: String){
        
            .tryMap { $0.data }
                        .decode(type: PostPreview.self, decoder: JSONDecoder())
                        .receive(on: RunLoop.main)
                        .catch { _ in Just(self.post) }
                        .sink { [weak self] in
                            self?.currentPage += 1
                            self?.postData.append(contentsOf: $0)
                            // If count of data received is less than perPage value then it is last page.
                            if $0.count < 10 {
                                self?.postListIsFull = true
                            }
                        }
    }
}
