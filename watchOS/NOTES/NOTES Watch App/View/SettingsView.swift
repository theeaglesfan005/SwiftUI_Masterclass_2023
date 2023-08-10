//
//  Settings.swift
//  NOTES Watch App
//
//  Created by Zach Bentley on 7/28/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTY
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    // MARK: - FUNCTION
    
    func update() {
        lineCount = Int(value)
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            
            // CURRENT COUNT NUMBER OF LINES
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
        } //: VSTACK
    }
}

#Preview {
    SettingsView()
}
