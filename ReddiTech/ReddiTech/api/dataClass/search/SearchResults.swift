//
//  SearchResults.swift
//  ReddiTech
//
//  Created by Anthony Luong on 28/02/2022.
//

import Foundation

// MARK: - SearchResults
struct SearchResults: Codable {
    var data: SearchResultsData?
}

// MARK: - SearchResultsData
struct SearchResultsData: Codable {
    var children: [SearchResultDataInner]?
}

struct SearchResultDataInner: Codable {
    var data: SearchChildData
}

// MARK: - ChildData
struct SearchChildData: Codable {
    var display_name : String?
    var title : String?
    var id : String?
    var header_img : String?
    var subscribers: Int?
}
