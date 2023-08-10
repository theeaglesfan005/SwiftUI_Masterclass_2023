//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Zach Bentley on 7/26/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
