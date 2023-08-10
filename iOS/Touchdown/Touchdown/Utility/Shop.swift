//
//  Shop.swift
//  Touchdown
//
//  Created by Zach Bentley on 7/25/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
