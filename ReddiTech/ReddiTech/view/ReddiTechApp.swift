//
//  ReddiTechApp.swift
//  ReddiTech
//
//  Created by William Risal on 14/02/2022.
//

import SwiftUI
import OAuthSwift

@main
struct ReddiTechApp: App {
    var auth = Auth()
    @StateObject private var dataController = DataController()
    var postService = PostService()
    @State var alert:Bool = true
    var body: some Scene {
        WindowGroup {
            TabView {
                if (alert == false) {
                    NavigationView {
                        ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
                    }.tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    NavigationView {
                        DiscoverView().environment(\.managedObjectContext, dataController.container.viewContext)
                    }.tabItem {
                        Image(systemName: "globe.europe.africa")
                        Text("Discover")
                    }
                    NavigationView {
                        AccountView().environment(\.managedObjectContext, dataController.container.viewContext)
                    }.tabItem {
                        Image(systemName: "person.fill")
                        Text("Account")
                    }
                }
                else {
                    VStack{
                        Spacer()
                        Text("Redditech").fontWeight(.bold).font(.system(size: 50))
                        Spacer()
                        Image("redditAvatar")
                        Spacer()
                        
                        OAuthConnectView().onOpenURL(perform: { url in
                            OAuthSwift.handle(url: url)
                            alert = false
                            
                        }).environment(\.managedObjectContext, dataController.container.viewContext)
                    }.padding(.horizontal)
                }
            }
        }
    }
}
