//
//  MineSub.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 08/03/2022.
//

import Foundation

// MARK: - MineSub
struct MineSub: Codable {
    let kind: String?
    let data: MineSubData?
}

// MARK: - MineSubData
struct MineSubData: Codable {
    let after: String?
    let children: [MineChild]?
}

// MARK: - Child
struct MineChild: Codable {
    let data: MineChildData?
}


struct MineChildData : Codable {
    let display_name: String?
    let banner_img: String?
    let id: String?
}
