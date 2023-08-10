//
//  CenterModifier.swift
//  Africa
//
//  Created by Zach Bentley on 2/28/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
