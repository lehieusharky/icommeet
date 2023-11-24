//
//  ImomeetVisionApp.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import SwiftUI

@main
struct ImomeetVisionApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppRouter())
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .onChange(of: scenePhase, {
            ImomeetState.performApplicationState(scenePhase)
        })
    }
}
