//
//  RipeningModel.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

// MARK: - RIPE MODEL

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
