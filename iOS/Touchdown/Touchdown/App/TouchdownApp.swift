//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Zach Bentley on 7/5/23.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
