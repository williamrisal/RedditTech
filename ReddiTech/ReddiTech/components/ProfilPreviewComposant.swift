//
//  ProfilPreviewComposant.swift
//  ReddiTech
//
//  Created by William Risal on 22/02/2022.
//

import SwiftUI
import OAuthSwift

struct ProfilPreviewComposant: View {
    var auth = Auth()
    @StateObject private var dataController = DataController()
    var user : UserInfos
    
//    var tabBarController : UITabBarController
    
    var body: some View {
        VStack{
            HStack {
                if let ImageUrl = URL(string: user.icon_img!) {
                    AsyncImage(url: ImageUrl){ image in
                        image.resizable()
                    } placeholder: {
                        Image("reddit_icon")
                            .resizable()
                    }
                    .cornerRadius(10)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                }
                Spacer()
                VStack {
                    Text("u/" + (user.name)!).bold()
                    HStack{
                        Image(systemName: "flame.fill")
                        Text("\(user.total_karma ?? 0) karmas")
                    }
                    HStack{
                        Image(systemName: "info.circle.fill")
                        Text(utils().timestampToDate(timestamp: user.created_utc ?? 0.0))
                    }
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Connected to Reddit")
                            }
                            NavigationLink(destination: LoginAlertView(), label: {
                            Text("Log Out")
                                .padding(10)
                                .font(Font.system(size: 15, weight: .medium))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.5))
                        })
                        }
                    }
                }
                .frame(alignment: .leading)
                Spacer()
            }.frame(alignment: .top)
            
        }.padding().background(Color("colorforlist")).cornerRadius(16)
    }
}

//struct ProfilPreviewComposant_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilPreviewComposant()
//    }
//}
