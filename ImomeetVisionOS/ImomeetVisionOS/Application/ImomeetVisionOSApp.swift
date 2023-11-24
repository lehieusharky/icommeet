//
//  ImomeetVisionOSApp.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 12/10/2023.
//

import SwiftUI

@main
struct ImomeetVisionOSApp: App {
    
    init() {
        ImommetApplication.shared.configuration()
    }
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
        
        WindowGroup(id: Constants.loginView) {
            LoginView()
        }
        .defaultSize(CGSize(width: 400, height: 450))
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.progressive), in: .progressive)
    }
}
