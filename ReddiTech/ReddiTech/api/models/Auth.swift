//
//  Auth.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 15/02/2022.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import Combine
import OAuthSwift


open class Auth {
    
    var uuid = UUID().uuidString
    
    var oauthswift = OAuth2Swift(
        consumerKey:    "B6HSibiG6ubdiQDJ1CWVVw",
        consumerSecret: "",
        authorizeUrl:   "https://www.reddit.com/api/v1/authorize",
        accessTokenUrl: "https://www.reddit.com/api/v1/access_token",
        responseType:   "code"
    )
    
    func getToken(){
        let utils = utils()
        oauthswift.accessTokenBasicAuthentification = true
        _ = oauthswift.authorize(
            withCallbackURL: "reddittech://response",

            scope: "identity+ edit+ flair+ history+ modconfig+ modflair+ modlog+ modposts+ modwiki+ account+ mysubreddits+ privatemessages+ read+ report+ save+ submit+ subscribe+ vote+ wikiedit+ wikiread", state: uuid, parameters: ["duration": "permanent"]) { result in
            switch result {
            case .success(let (credential, _, _)):
                utils.pushDefault(value: credential.oauthToken, key: "token")
                print("token: \(credential.oauthToken)")
            case .failure(let error):
                print(error)
            }
    }
}
}
