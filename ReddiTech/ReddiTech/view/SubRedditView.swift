//
//  SubRedditView.swift
//  ReddiTech
//
//  Created by William Risal on 01/03/2022.
//

import SwiftUI

struct SubRedditView: View {
    var postService = PostService()
    @State var onglet = "best"
    @State var postList = [Post]()
    @State var search = ""
    
    func loadData(type : String?){
        let t = postService.getPosts(type: type ?? "best")
        if(t != nil){
            self.postList = (t?.data.children)!
        }
    }
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack {
                    SubRedditPreviewComponant()
                    HStack{
                    Picker(selection: $onglet, label: Text("🥇 Best").tag("best")) {
                        Text("🥇 Best").tag("best")
                        Text("🔥 Hot").tag("hot")
                        Text("🆕 New").tag("new")
                        Text("🚀 Rising").tag("rising")
                                    
                    }.frame(alignment: .leading)
                        .padding(10)
                        .onChange(of: onglet){
                            loadData(type: $0)
                        }
                        Spacer()
                    }
                    ForEach(postList, id: \.data.id){ e in
                        PostPreviewComponant(innerPost: e.data)
                    }
                }
            }
        }.navigationTitle("")
            .navigationBarHidden(true).onAppear(perform: {
                loadData(type: onglet)
            })
    }
}

struct SubRedditView_Previews: PreviewProvider {
    static var previews: some View {
        SubRedditView()
    }
}
