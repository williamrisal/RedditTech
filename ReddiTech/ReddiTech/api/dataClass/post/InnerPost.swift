//
//  InnerPost.swift
//  ReddiTech
//
//  Created by Anthony Luong on 21/02/2022.
//

import Foundation

struct InnerPost: Codable {
    var author: String
    var title: String
//    var url_overridden_by_dest: String
    var subreddit_name_prefixed: String
    var ups: Int
    var num_comments: Int
    var over_18: Bool
    var spoiler: Bool
    var visited: Bool
    var subreddit_id: String
    var id: String
    var subreddit_subscribers: Int
}

// TODO: Utiliser enum pour renommer les variables utilisées

// enum CodingKeys: String, CodingKey {
//     case subredditNamePrefixed = "subreddit_name_prefixed"
// }
