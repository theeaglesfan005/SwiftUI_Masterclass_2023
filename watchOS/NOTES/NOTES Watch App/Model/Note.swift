//
//  Note.swift
//  NOTES Watch App
//
//  Created by Zach Bentley on 7/27/23.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
