//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Zach Bentley on 7/25/23.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content : {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            }) //: GRID
            .frame(height: 200)
            .padding(15)
        }) //: SCROLL
    }
}

#Preview {
    BrandGridView()
        .previewLayout(.sizeThatFits)
        .background(colorBackground)
}
