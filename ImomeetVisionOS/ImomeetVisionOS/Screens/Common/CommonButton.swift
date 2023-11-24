//
//  CommonButtonView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 07/11/2023.
//

import SwiftUI

struct CommonButton: View {
    private var contentTitle: String
    private let borderRadius: CGFloat
    private let borderWidth: CGFloat
    private let borderColor: ThemeColorPicker
    private let backgroundColor: ThemeColorPicker
    
    private var content: AnyView?
    private var onClick: () -> Void
    
    init(title: String,
         borderRadius: CGFloat = 5,
         borderWidth: CGFloat = 0,
         borderColor: ThemeColorPicker = ThemeColorPicker(staticValue: Color.clear),
         backgroundColor: ThemeColorPicker = ThemeColorPicker(staticValue: Color.clear),
         onClick: @escaping () -> Void) {
        self.contentTitle = title
        self.borderRadius = borderRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.backgroundColor = backgroundColor
        self.onClick = onClick
    }
    
    init(borderRadius: CGFloat = 5,
         borderWidth: CGFloat = 0,
         borderColor: ThemeColorPicker = ThemeColorPicker(staticValue: Color.clear),
         backgroundColor: ThemeColorPicker = ThemeColorPicker(staticValue: Color.clear),
         onClick: @escaping () -> Void,
         @ViewBuilder content: @escaping () -> some View) {
        self.contentTitle = ""
        self.borderRadius = borderRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.backgroundColor = backgroundColor
        self.onClick = onClick
        self.content = AnyView(content())
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: borderRadius)
                .filled(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: borderRadius)
                        .stroke(borderColor, width: borderWidth)
                )
            
            VStack(
                alignment: .center,
                content: {
                    if let content = content {
                        content
                    } else {
                        Text(contentTitle)
                            .adjustedSystemFont(ofSize: 14, weight: .semibold)
                    }
                }
            )
        }
        .edgesIgnoringSafeArea(.all)
        .onTouchScaleEffectGesture {
            onClick()
        }
    }
}

#Preview {
    CommonButton(title: "Touch Here",
                 borderRadius: 25,
                 borderWidth: 2,
                 borderColor: GlobalThemePicker.whiteColor,
                 backgroundColor: GlobalThemePicker.blackColor) {
        //
    }
    .frame(width: 300, height: 40)
}
