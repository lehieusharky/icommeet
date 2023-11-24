//
//  View+Ext.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 15/11/2023.
//

import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    func onTouchScaleEffectGesture(callback: @escaping () -> Void) -> some View {
        modifier(TouchScaleEffectGestureModifier(callback: callback))
    }
}
