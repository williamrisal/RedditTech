//
//  SearchResultComponent.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 28/02/2022.
//

import SwiftUI

struct SearchResultComponent: View {
    var sd : SearchResultDataInner
    var body: some View {
        NavigationLink(destination: SubredditDetailsView(name: self.sd.data.display_name ?? "name")){
            HStack{
                if let ImageUrl = URL(string: sd.data.header_img ?? "reddit_icon") {
                    AsyncImage(url: ImageUrl){ image in
                        image.resizable()
                    } placeholder: {
                        Image("reddit_icon")
                            .resizable()
                    }
                    .cornerRadius(10)
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(Circle())
                    .scaledToFit()
                }
                VStack(alignment: .leading){
                    Text("r/\(sd.data.display_name ?? "name")")
                        .bold()
                    Text("\(sd.data.subscribers ?? 0) members")
                }
            }
        }
    }
}
