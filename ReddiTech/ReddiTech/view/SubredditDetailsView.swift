//
//  SubredditDetailsView.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 01/03/2022.
//

import SwiftUI

struct SubredditDetailsView: View {
    var name : String
    
    @ObservedObject var bestFeed : PostFeedBySubreddit
    @ObservedObject var hotFeed : PostFeedBySubreddit
    @ObservedObject var newFeed : PostFeedBySubreddit
    
    init(name : String){
        self.name = name
        self.newFeed = PostFeedBySubreddit(type: "new", name: name)
        self.hotFeed = PostFeedBySubreddit(type: "hot", name: name)
        self.bestFeed = PostFeedBySubreddit(type: "best", name: name)
    }
    
    @State var onglet = "best"
    @State var postList = [Post]()
    
    
    var subService = SubRedditService()
    @State var subAbout = SubRedditAbout()
    func loadData(){
        if let loadAboutData = subService.getSubredditAbout(subreddit: name) {
            subAbout = loadAboutData
        }
        
    }
    var body: some View {
        ScrollView{
            VStack{
                SubRedditPreviewComponant(sub: subAbout)
                HStack{
                    Picker(selection: $onglet, label: Text("🥇 Best").tag("best")){
                        Text("🥇 Best").tag("best")
                        Text("🔥 Hot").tag("hot")
                        Text("🆕 New").tag("new")
                        
                        
                    }.frame(alignment: .leading)
                        .padding(10)
                    Spacer()
                }
                switch(onglet){
                case("best"):
                    ForEach(bestFeed.postList, id: \.data.id) { e in
                        PostPreviewComponant(innerPost: e.data).listRowSeparator(.hidden)
                    }
                    if bestFeed.isFull == false {
                        ProgressView("Chargement")
                            .onAppear {
                                bestFeed.fetchPost()
                            }
                    }
                    
                case("hot"):
                    ForEach(hotFeed.postList, id: \.data.id) { e in
                        PostPreviewComponant(innerPost: e.data)
                    }
                    if hotFeed.isFull == false {
                        ProgressView("Chargement")
                            .onAppear {
                                hotFeed.fetchPost()
                            }
                    }
                    
                case("new"):
                    ForEach(newFeed.postList, id: \.data.id) { e in
                        PostPreviewComponant(innerPost: e.data)
                    }
                    if newFeed.isFull == false {
                        ProgressView("Chargement")
                            .onAppear {
                                newFeed.fetchPost()
                            }
                    }
                    
                default:
                    ForEach(bestFeed.postList, id: \.data.id) { e in
                        PostPreviewComponant(innerPost: e.data)
                    }
                    if bestFeed.isFull == false {
                        ProgressView("Chargement")
                            .onAppear {
                                bestFeed.fetchPost()
                            }
                    }
                }
            }
            
        }.onAppear(perform: loadData)
            .navigationTitle("")
    }
}

struct SubredditDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SubredditDetailsView(name : "fra")
    }
}
