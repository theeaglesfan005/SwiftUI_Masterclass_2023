//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Zach Bentley on 8/8/23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}
