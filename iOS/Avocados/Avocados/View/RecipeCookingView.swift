//
//  RecipeCookingView.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

struct RecipeCookingView: View {
    // MARK: - PROPERTIES
    
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Serves: \(recipe.serves)")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation) min")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Cook: \(recipe.cooking) min")
            }
            
        } // HSTACK
        .font(.footnote)
        .foregroundColor(Color.gray)
    }
}

#Preview {
    RecipeCookingView(recipe: recipesData[0])
        .previewLayout(.fixed(width: 320, height: 60))
}
