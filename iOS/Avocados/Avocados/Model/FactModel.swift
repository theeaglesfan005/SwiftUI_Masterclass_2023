//
//  FactModel.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

// MARK: - FACT MODEL

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
