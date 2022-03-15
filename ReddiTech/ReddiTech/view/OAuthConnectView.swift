//
//  OAuthConnectView.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 15/02/2022.
//

import SwiftUI
import Combine
import OAuthSwift

struct OAuthConnectView: View {
    var auth = Auth()
    var postService = PostService()
    let subRedditService = SubRedditService()
    @StateObject private var dataController = DataController()

    var body: some View {
        
        Button(action:  {
            auth.getToken()
                }) {
                    Text("Connect with Reddit")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(Color.redditRed)
                        .cornerRadius(10)
                }
    }
}

struct OAuthConnectView_Previews: PreviewProvider {
    static var previews: some View {
        OAuthConnectView()
    }
}
