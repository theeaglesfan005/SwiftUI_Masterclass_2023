//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Zach Bentley on 7/5/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
