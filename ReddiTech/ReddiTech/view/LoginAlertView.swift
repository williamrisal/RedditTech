//
//  LoginAlertView.swift
//  ReddiTech
//
//  Created by William Risal on 08/03/2022.
//

import SwiftUI
import OAuthSwift

struct LoginAlertView: View {
    
    @StateObject private var dataController = DataController()
    var body: some View {
        VStack{
            Spacer()
            Text("Redditech").fontWeight(.bold).font(.system(size: 50))
            Spacer()
            Image("redditAvatar")
            Spacer()
            
            OAuthConnectView().onOpenURL(perform: { url in
                OAuthSwift.handle(url: url)
                
            }).environment(\.managedObjectContext, dataController.container.viewContext)
        }.padding(.horizontal).navigationBarHidden(true)
    }
}
