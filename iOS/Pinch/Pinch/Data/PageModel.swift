//
//  PageModel.swift
//  Pinch
//
//  Created by Zach Bentley on 2/16/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
