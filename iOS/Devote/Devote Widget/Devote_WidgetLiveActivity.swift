//
//  Devote_WidgetLiveActivity.swift
//  Devote Widget
//
//  Created by Zach Bentley on 7/26/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Devote_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Devote_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Devote_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Devote_WidgetAttributes {
    fileprivate static var preview: Devote_WidgetAttributes {
        Devote_WidgetAttributes(name: "World")
    }
}

extension Devote_WidgetAttributes.ContentState {
    fileprivate static var smiley: Devote_WidgetAttributes.ContentState {
        Devote_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Devote_WidgetAttributes.ContentState {
         Devote_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Devote_WidgetAttributes.preview) {
   Devote_WidgetLiveActivity()
} contentStates: {
    Devote_WidgetAttributes.ContentState.smiley
    Devote_WidgetAttributes.ContentState.starEyes
}
