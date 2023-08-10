//
//  AppView.swift
//  Avocados
//
//  Created by Zach Bentley on 8/2/23.
//

import SwiftUI

struct AppView: View {
    // MARK: - PROPERTY
    
    let impactMed = UIImpactFeedbackGenerator(style: .medium)
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab.onUpdate{ impactMed.impactOccurred() }) {
            AvocadosView()
                .tabItem {
                    Image("tabicon-branch")
                    Text("Avocados")
                }
                .tag(1)
            ContentView()
                .tabItem {
                    Image("tabicon-book")
                    Text("Recipes")
                }
                .tag(2)
            RipeningStagesView()
                .tabItem {
                    Image("tabicon-avocado")
                    Text("Ripening")
                }
                .tag(3)
            SettingsView()
                .tabItem {
                    Image("tabicon-settings")
                    Text("Settings")
                }
                .tag(4)
        } // TABVIEW
        .accentColor(Color.primary)
    }
}

extension Binding {
    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            closure()
        })
    }
}


#Preview {
    AppView()
}
