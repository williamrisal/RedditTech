//
//  PostPreview.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 20/02/2022.
//

import Foundation

struct PostPreview : Codable{
    var data : DataPost
}

struct DataPost : Codable {
    var after : String
    var children : [Post]
}

struct Post : Codable {
    var data: InnerPost
}

struct InnerPost: Codable {
    var author: String?
    var title: String?
    var post_hint: String?
    var subreddit_name_prefixed: String?
    var url_overridden_by_dest: String?
    var permalink: String?
    var ups: Int?
    var num_comments: Int?
    var over_18: Bool?
    var spoiler: Bool?
    var visited: Bool?
    var subreddit_id: String?
    var id: String?
    var subreddit_subscribers: Int?
    var secure_media: SecureMedia?
    var is_video: Bool?
}

struct SecureMedia : Codable {
    var reddit_video: RedditVideo?
}
