//
//  Extensions.swift
//  Slot Machine
//
//  Created by Zach Bentley on 7/31/23.
//

import SwiftUI

extension Text {
    func scoreLabelStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberSTyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
}
