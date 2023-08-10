//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Zach Bentley on 7/26/23.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        GeometryReader { geometry in
            Image("Untitled-1")
                .antialiased(true)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
