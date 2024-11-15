//
//  MooduWidgetBundle.swift
//  MooduWidget
//
//  Created by Alex Park on 11/15/24.
//

import WidgetKit
import SwiftUI

@main
struct MooduWidgetBundle: WidgetBundle {
    var body: some Widget {
        MooduWidget()
        MooduWidgetLiveActivity()
    }
}
