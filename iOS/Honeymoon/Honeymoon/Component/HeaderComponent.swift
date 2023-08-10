//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Zach Bentley on 8/8/23.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        } // VSTACK
    }
}

#Preview {
    HeaderComponent()
        .previewLayout(.fixed(width: 375, height: 128))
}
