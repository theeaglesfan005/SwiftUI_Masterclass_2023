//
//  CardView.swift
//  Hike
//
//  Created by Zach Bentley on 8/9/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTY
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTION
    func randomImage() {
        print("--- FOOTER BUTTON WAS PRESSED ---")
        print("Status: Old Image Number = \(imageNumber)")
        
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: RNG = \(randomNumber)")
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        print("Result: New Image Number = \(imageNumber)")
        print("--- THE END ---\n")
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } // HEADER
                .padding(.horizontal, 30)
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                // MARK: - FOOTER
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight, .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        } // CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
