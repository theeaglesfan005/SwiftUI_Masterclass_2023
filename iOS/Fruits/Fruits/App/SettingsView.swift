//
//  SettingsView.swift
//  Fruits
//
//  Created by Zach Bentley on 2/17/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
        
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "Fruits", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholestrial. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    }
                    
                    // MARK: - SECTION 2
                    GroupBox(
                        label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        Text("Would you like to restart the app to the welcome/splash screen?")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }
                    
                    // MARK: - SECTION 3
                    GroupBox(
                        label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ) {
                        
                        SettingsRowView(name: "Developer", content: "Zachary Bentley")
                        SettingsRowView(name: "Designer", content: "Zachary Bentley")
                        SettingsRowView(name: "Compatibility", content: "iOS 14+")
                        SettingsRowView(name: "Website", linkLabel: "Github", linkDestination: "github.com/theeaglesfan005")
                        SettingsRowView(name: "Twitter", linkLabel: "@theeaglesfan005", linkDestination: "twitter.com/theeaglesfan005")
                        SettingsRowView(name: "Swift(UI)", content: "5.7.2")
                        SettingsRowView(name: "App Version", content: "1.0.0")
                    } //: BOX
                    
                } //: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                    )
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
