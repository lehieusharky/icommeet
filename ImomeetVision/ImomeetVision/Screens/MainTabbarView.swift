//
//  MainTabbarView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation
import SwiftUI

struct MainTabbarView: View {
    var body: some View {
        NavigationView {
            SideBarView()
//                .frame(minWidth: 200, maxWidth: 210)
        }
        .background(VisualEffectView().ignoresSafeArea())
    }
}
