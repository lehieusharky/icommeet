//
//  VisualEffectView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation
import SwiftUI

struct VisualEffectView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let effectView = NSVisualEffectView()
        effectView.state = .active
        return effectView
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
    }
}
