//
//  DiscoverView.swift
//  ReddiTech
//
//  Created by Anthony Luong on 01/03/2022.
//

import SwiftUI

struct DiscoverView: View {
    
    @State var search = ""
    @ObservedObject var subFeed = SubFeed()
    var subList = [MineChild]()
    
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
                TextField("Search", text: $search)
                  .padding(10)
                  .font(Font.system(size: 15, weight: .medium))
                  .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
            })
            Spacer()
        }
            List {
                ForEach(subFeed.subList, id: \.data!.id!) { e in
                    //PostPreviewComponant(innerPost: e.data).listRowSeparator(.hidden)
                    SubredditCardView(data : e.data!).listRowSeparator(.hidden)
                }
                if subFeed.isFull == false {
                    ProgressView("Chargement")
                        .onAppear {
                            subFeed.fetchSub()
                        }
                }
            }.listStyle(PlainListStyle())
            
        }.navigationTitle("").navigationBarHidden(true).transition(.slide).animation(.default).onAppear(perform: {subFeed.fetchSub()})
        
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
