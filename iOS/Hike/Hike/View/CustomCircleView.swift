//
//  CustomCircleView.swift
//  Hike
//
//  Created by Zach Bentley on 8/9/23.
//

import SwiftUI

struct CustomCircleView: View {
    // MARK: - PROPERTY
    @State private var isAnimateGradient: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors:
                            [
                                Color.customIndigoMedium,
                                Color.customSalmonLight
                            ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear() {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimartionView()
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
