//
//  HeaderModel.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

// MARK: - HEADER MODEL

struct Header: Identifiable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
