//
//  SubredditCardView.swift
//  ReddiTech
//
//  Created by Anthony Luong on 01/03/2022.
//

import SwiftUI

struct SubredditCardView: View {
    var data : MineChildData
    var body: some View {
        NavigationLink(destination: SubredditDetailsView(name: self.data.display_name ?? "name")) {
        VStack{
            Spacer()
            Text("r/\(data.display_name ?? "name")")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: Alignment.leading)
                .padding(20)
        }.frame(width: 350, height: 120, alignment: .center)
            .background(
                AsyncImage(url: URL(string: data.banner_img ?? "no"), content: {image in
                    image.resizable()
                        .frame(width: 500, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)

                            
                }, placeholder: {
                    Image("bannerBase")

                })
            )
            .foregroundColor(Color.white)
            .padding(.horizontal, 16)
            .cornerRadius(20)
    }
    }
}

//struct SubredditCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubredditCardView().navigationTitle("")
//            .navigationBarHidden(true)
//    }
//}
