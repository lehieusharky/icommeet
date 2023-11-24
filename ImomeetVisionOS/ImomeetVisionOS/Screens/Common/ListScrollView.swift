//
//  ListScrollView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 08/11/2023.
//

import Foundation
import SwiftUI

struct ListVertical<Content: View>: View {
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(content: {
                content
            })
        }
    }
}

struct ListHorizal<Content: View>: View {
    
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(content: {
                content
            })
        }
    }
}
