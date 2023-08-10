//
//  BlankView.swift
//  Devote
//
//  Created by Zach Bentley on 7/26/23.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTY
    
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
        .background(BackgroundImageView())
        .background(backgroundGradient.ignoresSafeArea(.all))
}
