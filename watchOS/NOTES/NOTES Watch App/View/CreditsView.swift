//
//  CreditsView.swift
//  NOTES Watch App
//
//  Created by Zach Bentley on 7/28/23.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTY
    
    @State private var randomNumber: Int = Int.random(in: 1..<5)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            //Image("developer-no4")
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // HEADER
            HeaderView(title: "Credits")
            
            // CONTENT
            Text("Zachary Bentley")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } //: VSTACK
    }
}

#Preview {
    CreditsView()
}
