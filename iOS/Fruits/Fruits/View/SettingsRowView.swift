//
//  SettingsRowView.swift
//  Fruits
//
//  Created by Zach Bentley on 2/17/23.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            } //: HSTACK
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "Zachary Bentley")
            .previewLayout(.fixed(width: 370, height: 60))
            .padding()
        SettingsRowView(name: "Website", linkLabel: "Github", linkDestination: "github.com/theeaglesfan005")
            .previewLayout(.fixed(width: 370, height: 60))
            .padding()
    }
}
