//
//  ProductItemView.swift
//  Touchdown
//
//  Created by Zach Bentley on 7/5/23.
//

import SwiftUI

struct ProductItemView: View {
    // MARK: - PROPERTY
    
    let product: Product
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            // PHOTO
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            } //: ZSTACK
            .background(Color(red: product.red, green: product.green, blue: product.blue))
            .cornerRadius(12)
            
            // NAME
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            // PRICE
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }) //: VSTACK
    }
}

#Preview {
    ProductItemView(product: products[0])
        .previewLayout(.fixed(width: 200, height: 300))
        .background(colorBackground)
}
