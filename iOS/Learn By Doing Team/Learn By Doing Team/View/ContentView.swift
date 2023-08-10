//
//  ContentView.swift
//  Learn By Doing Team
//
//  Created by Zach Bentley on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    var cards: [Card] = cardData
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            } // HSTACK
            .padding(20)
        } // SCROLL
    }
}

#Preview {
    ContentView(cards: cardData)
}
