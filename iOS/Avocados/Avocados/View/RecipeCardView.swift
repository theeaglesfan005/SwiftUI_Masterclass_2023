//
//  RecipeCardView.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

struct RecipeCardView: View {
    // MARK: - PROPERTY
    
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // MARK: - CARD IMAGE
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundColor(Color.white)
                                .imageScale(.small)
                            .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                            .padding(.trailing, 20)
                            .padding(.top, 22)
                            Spacer()
                        } // VSTACK
                    } // HSTACK
                )
            
            VStack(alignment: .leading, spacing: 12) {
                // MARK: - TITLE
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                
                // MARK: - HEADLINE
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(Color.gray)
                    .italic()
                
                // MARK: - RATES
                RecipeRatingView(recipe: recipe)
                
                
                // MARK: - COOKING
                RecipeCookingView(recipe: recipe)
                
            } // VSTACK
            .padding()
            .padding(.bottom, 12)
        } // VSTACK
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal) {
            RecipeDetailView(recipe: self.recipe)
        }
    }
}

#Preview {
    RecipeCardView(recipe: recipesData[0])
        .previewLayout(.sizeThatFits)
}
