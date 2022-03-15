//
//  SubRedditPreviewComponant.swift
//  ReddiTech
//
//  Created by William Risal on 01/03/2022.
//

import SwiftUI
import Swift

struct SubRedditPreviewComponant: View {
    var sub : SubRedditAbout
    @State var isSub : Bool? = nil
    var subService = SubRedditService()
    var subscribeservice = SubscribeService()
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack{
                Text(sub.data?.display_name ?? "name")
                    .fontWeight(.bold)
                    .frame(alignment: Alignment.leading)
                    .padding(5)
                    .background(Color.blackBg)
                    .cornerRadius(5)
                Spacer()
                Button(action: {
                                    if(isSub == nil){
                                        if(sub.data!.user_is_subscriber!){
                                            subscribeservice.unsub(name: sub.data!.display_name!)
                                            self.isSub = false
                                        }else{
                                            self.isSub = true
                                            subscribeservice.sub(name: sub.data!.display_name!)
                                        }
                                    }else{
                                        if(isSub!){
                                            subscribeservice.unsub(name: sub.data!.display_name!)
                                            self.isSub = false
                                        }else{
                                            self.isSub = true
                                            subscribeservice.sub(name: sub.data!.display_name!)
                                        }
                                    }
                                }){
                                        Spacer()
                                    Text(isSub == nil ? (sub.data?.user_is_subscriber ?? true) ? "Joined" : "Join" : isSub! ? "Joined" : "Join")
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    .background(Color.orange)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                                    .frame(width: 80, height: 40, alignment: .trailing)
                                    .padding(.trailing)
            }.padding(.leading, 30)
            
            HStack{
                HStack{
                    Image(systemName: "person.2")
                        .font(Font.system(size: 12))
                    Text("\(sub.data?.subscribers ?? 0) members")
                        .font(Font.system(size: 12))
                }
                .padding(5)
                .background(Color.blackBg)
                .cornerRadius(5)
                Spacer()
            }
            Text(sub.data?.public_description ?? "")
                .frame(alignment: Alignment.leading)
                .padding(5)
                .background(Color.blackBg)
                .cornerRadius(5)
            Spacer()
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: 250, alignment: Alignment.leading)
            .padding(5)
            .background(AsyncImage(url: URL(string: utils().splintLink(link: sub.data?.banner_background_image ?? "n?n") ?? "")).background(Image("bannerBase").resizable()))
        
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

//struct SubRedditPreviewComponantView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubRedditPreviewComponant(sub: SubRedditAbout(kind: "", data: DataAboutClass(display_name: "toto", public_description: "oucou", banner_background_image: "", subscribers: 12020)))
//    }
//}
