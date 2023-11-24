//
//  SideBarView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation
import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack {
            List(1...10, id: \.self) { index in
                NavigationLink {
                    WelcomeView(value: index)
                } label: {
                    Text("Items \(index)")
                }
            }
            .frame(minWidth: 100, maxWidth: 110)
        }
    }
}
