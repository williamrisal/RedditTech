//
//  ContentView.swift
//  ReddiTech
//
//  Created by William Risal on 14/02/2022.
//

import SwiftUI

struct ContentView : View {
    @ObservedObject var bestFeed = PostFeed(type: "best")
    @ObservedObject var hotFeed = PostFeed(type: "hot")
    @ObservedObject var newFeed = PostFeed(type: "new")
    @State var onglet = "best"
    @State var postList = [Post]()
    @State var search = ""
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Image("reddit_icon")
                    .resizable()
                    .clipShape(Circle())
                    .frame(maxWidth: 40, maxHeight: 40)
                    .padding(10)
                
                Spacer()
                NavigationLink(destination: SearchView(), label: {
                    TextField("🔍 Search", text: $search)
                      .padding(10)
                      .font(Font.system(size: 15, weight: .medium))
                      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
                })
                Spacer()
            }
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
                    List {
                        ForEach(bestFeed.postList, id: \.data.id) { e in
                            PostPreviewComponant(innerPost: e.data).listRowSeparator(.hidden)
                        }
                        if bestFeed.isFull == false {
                            ProgressView("Chargement")
                                .onAppear {
                                    bestFeed.fetchPost()
                                }
                        }
                    }.listStyle(PlainListStyle())

                case("hot"):
                    List {
                        ForEach(hotFeed.postList, id: \.data.id) { e in
                            PostPreviewComponant(innerPost: e.data).listRowSeparator(.hidden)
                        }
                        if hotFeed.isFull == false {
                            ProgressView("Chargement")
                                .onAppear {
                                    hotFeed.fetchPost()
                                }
                        }
                    }.listStyle(PlainListStyle())
                case("new"):
                    List {
                        ForEach(newFeed.postList, id: \.data.id) { e in
                            PostPreviewComponant(innerPost: e.data).listRowSeparator(.hidden)
                        }
                        if newFeed.isFull == false {
                            ProgressView("Chargement")
                                .onAppear {
                                    newFeed.fetchPost()
                                }
                        }
                    }.listStyle(PlainListStyle())
            default:
                List {
                    ForEach(bestFeed.postList, id: \.data.id) { e in
                        PostPreviewComponant(innerPost: e.data).listRowSeparator(.hidden)
                    }
                    if bestFeed.isFull == false {
                        ProgressView("Chargement")
                            .onAppear {
                                bestFeed.fetchPost()
                            }
                    }
                }.listStyle(PlainListStyle())
            }

        }.navigationTitle("")
            .navigationBarHidden(true).onAppear(perform:{
                bestFeed.fetchPost()
            })
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
