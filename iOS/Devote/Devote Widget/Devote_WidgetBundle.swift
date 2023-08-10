//
//  Devote_WidgetBundle.swift
//  Devote Widget
//
//  Created by Zach Bentley on 7/26/23.
//

import WidgetKit
import SwiftUI

@main
struct Devote_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Devote_Widget()
        Devote_WidgetLiveActivity()
    }
}
