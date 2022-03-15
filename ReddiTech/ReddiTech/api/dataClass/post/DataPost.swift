//
//  Data.swift
//  ReddiTech
//
//  Created by Adison Pereira de oliveira on 20/02/2022.
//

import Foundation

struct DataPost : Codable {
    var after : String
    var children : [Post]
}
