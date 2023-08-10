//
//  GuideView.swift
//  Honeymoon
//
//  Created by Zach Bentley on 8/8/23.
//

import SwiftUI

struct GuideView: View {
    // MARK: - PROPERTY
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect desination for your romantc Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(
                        title: "Like",
                        subtitle: "Swipe Right",
                        description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favorites.",
                        icon: "heart.circle")
                    
                    GuideComponent(
                        title: "Dismiss",
                        subtitle: "Swipe Left",
                        description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                        icon: "xmark.circle")
                    
                    GuideComponent(
                        title: "Book",
                        subtitle: "Tap the button",
                        description: "Our selection of honeymoon resorts are perfect for you to embark on your new life together.",
                        icon: "checkmark.square")
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Continue".uppercased())
                            .modifier(ButtonModifier())
                    }
                } // VSTACK
                
                Spacer(minLength: 10)
            } // VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        } // SCROLL
    }
}

#Preview {
    GuideView()
}
