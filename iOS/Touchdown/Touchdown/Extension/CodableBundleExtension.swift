//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Zach Bentley on 7/5/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate JSON File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 3. Create decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return the data
        return decodedData
    }
}
