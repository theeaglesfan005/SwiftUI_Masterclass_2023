//
//  VideoModel.swift
//  Africa
//
//  Created by Zach Bentley on 2/27/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
