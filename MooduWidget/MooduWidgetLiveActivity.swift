//
//  MooduWidgetLiveActivity.swift
//  MooduWidget
//
//  Created by Alex Park on 11/15/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MooduWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MooduWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MooduWidgetAttributes.self) { context in
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

extension MooduWidgetAttributes {
    fileprivate static var preview: MooduWidgetAttributes {
        MooduWidgetAttributes(name: "World")
    }
}

extension MooduWidgetAttributes.ContentState {
    fileprivate static var smiley: MooduWidgetAttributes.ContentState {
        MooduWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MooduWidgetAttributes.ContentState {
         MooduWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MooduWidgetAttributes.preview) {
   MooduWidgetLiveActivity()
} contentStates: {
    MooduWidgetAttributes.ContentState.smiley
    MooduWidgetAttributes.ContentState.starEyes
}
