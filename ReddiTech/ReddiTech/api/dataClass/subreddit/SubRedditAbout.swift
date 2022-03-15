//
//  SubRedditAbout.swift
//  ReddiTech
//
//  Created by Anthony Luong on 26/02/2022.
//

import Foundation

// MARK: - SubReddit
struct SubRedditAbout: Codable {
    var kind: String?
    var data: DataAboutClass?
}

// MARK: - DataClass
struct DataAboutClass: Codable {
    var display_name : String?
    var public_description : String?
    var banner_background_image : String?
    //var community_icon : String?
    var subscribers : Int?
    var user_is_subscriber: Bool?
}
