//
//  ImomeetState.swift
//  ImomeetVision
//
//  Created by Thien Vu on 02/10/2023.
//

import Foundation
import SwiftUI

class ImomeetState {
    static func performApplicationState(_ scene: ScenePhase) {
        switch scene {
        case .background:
            print("App State : Background")
        case .inactive:
            print("App State : Inactive")
        case .active:
            print("App State : Active")
        @unknown default:
            print("App State : Unknown")
        }
    }
    
    struct AppView: View {
        var route: Route?
        
        init(route: Route?) {
            self.route = route
        }
        
        var body: some View {
            if let currentRoute = route {
                switch currentRoute {
                case .login:
                    LoginView()
                        .frame(minWidth: 400, minHeight: 450)
                case .main :
                    MainTabbarView()
                        .frame(minWidth: 1000, minHeight: 600)
                }
            } else {
                SFEmptyView()
            }
        }
    }
}
