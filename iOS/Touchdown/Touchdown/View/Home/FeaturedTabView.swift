//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Zach Bentley on 7/5/23.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    FeaturedTabView()
        .previewDevice("iPhone 12 Pro")
        .background(Color.gray)
}
