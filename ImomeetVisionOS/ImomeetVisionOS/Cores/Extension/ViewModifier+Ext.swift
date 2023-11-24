//
//  ViewModifier+Ext.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 19/11/2023.
//

import Foundation
import SwiftUI

public struct CommonViewModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
    }
}

public struct TouchScaleEffectGestureModifier: ViewModifier {
    @State private var isTapped: Bool = false
    private let callback: () -> Void
    
    init(callback: @escaping () -> Void) {
        self.callback = callback
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isTapped ? 0.9 : 1.0)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        withAnimation(.linear(duration: 0.2)){
                            self.isTapped = true
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.linear(duration: 0.2)){
                            self.isTapped = false
                        }
                        callback()
                    }
            )
    }
}
