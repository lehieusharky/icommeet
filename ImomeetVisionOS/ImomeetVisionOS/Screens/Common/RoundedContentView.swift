//
//  RoundedContentView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import SwiftUI

struct RoundedContentView<Content: View>: View {
    private let filledColor: ThemeColorPicker
    private let radius: CGFloat
    private let content: Content
    
    init(radius: CGFloat = 25,
        filledColor: ThemeColorPicker = ThemeColorPicker(staticValue: Color.clear),
        @ViewBuilder content: () -> Content) {
        self.radius = radius
        self.filledColor = filledColor
        self.content = content()
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .filled(filledColor)
            .overlay(
                content
        )
    }
}

#Preview {
    RoundedContentView(filledColor: GlobalThemePicker.redColor) {
        Text("Hello world")
    }
    .frame(width: 500, height: 500)
}
