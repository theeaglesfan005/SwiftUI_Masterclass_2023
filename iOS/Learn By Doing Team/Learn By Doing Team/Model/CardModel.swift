//
//  CardModel.swift
//  Learn By Doing Team
//
//  Created by Zach Bentley on 8/7/23.
//

import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
