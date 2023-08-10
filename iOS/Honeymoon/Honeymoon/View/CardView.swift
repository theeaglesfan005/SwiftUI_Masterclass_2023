//
//  CardView.swift
//  Honeymoon
//
//  Created by Zach Bentley on 8/8/23.
//

import SwiftUI

struct CardView: View, Identifiable {
    // MARK: - PROPERTY

    let id = UUID()
    var honeymoon: Destination

    // MARK: - CARD
    
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .overlay(
                VStack(alignment: .center, spacing: 12) {
                    Text(honeymoon.place.uppercased())
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.bottom, 4)
                        .overlay(
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 1),
                            alignment: .bottom
                        )
                    Text(honeymoon.country.uppercased())
                        .foregroundColor(Color.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(Color.white)
                        )
                } // VSTACK (Place)
                .frame(minWidth: 280)
                .padding(.bottom, 50),
                alignment: .bottom
            )
    }
}

#Preview {
    CardView(honeymoon: honeymoonData[0])
        .previewLayout(.fixed(width: 375, height: 600))
}
