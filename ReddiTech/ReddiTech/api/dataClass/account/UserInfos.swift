//
//  UserInfos.swift
//  ReddiTech
//
//  Created by Anthony Luong on 08/03/2022.
//

import Foundation

// MARK: - UserInfos

struct UserInfos : Codable {
    var icon_img: String?
    var total_karma: Int?
    var name: String?
    var created_utc: Double?
}
