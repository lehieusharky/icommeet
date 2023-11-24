//
//  SFEmptyView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import Foundation
import SwiftUI

struct SFEmptyView: View {
    private var title: String
    private var decriptions: String
    
    init(title: String = "Empty", decriptions: String = "No data") {
        self.title = title
        self.decriptions = decriptions
    }
    
    var body: some View {
        VStack {
            ContentUnavailableView {
                Label(title, systemImage: "tray.fill")
            } description: {
                Text(decriptions)
            }
        }
    }
}

#Preview {
    SFEmptyView()
}
