//
//  HeaderView.swift
//  NOTES Watch App
//
//  Created by Zach Bentley on 7/28/23.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTY
    
    var title: String = ""
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            // TITLE
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // SEPARATOR
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HSTACK
            .foregroundColor(.accentColor)
        } //: VSTACK
    }
}

#Preview {
    Group {
        HeaderView(title: "Credits")
        
        HeaderView()
    }
}
