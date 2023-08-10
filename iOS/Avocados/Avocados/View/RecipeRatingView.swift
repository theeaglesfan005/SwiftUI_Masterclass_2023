//
//  RecipeRatingView.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

struct RecipeRatingView: View {
    // MARK: - PROPERTY
    
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(Color.yellow)
            } // Rating Loop
        } // HSTACK (Ratings)
    }
}

#Preview {
    RecipeRatingView(recipe: recipesData[0])
        .previewLayout(.fixed(width: 320, height: 60))
}
