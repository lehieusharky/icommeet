//
//  LoadingView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    private var isLoading: Bool
    
    init(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    var body: some View {
        if isLoading {
            GeometryReader { geometry in
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            ProgressView().tint(.white)
                                .scaleEffect(1.5) // You can adjust the scale of the loading indicator
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .foregroundColor(.white)
                            Text("id_loading".localizedLanguage())
                        }
                    )
                    .onTapGesture { /* Optionally handle tap on the overlay */ }
            }
        } else {
            EmptyView()
        }
    }
}
