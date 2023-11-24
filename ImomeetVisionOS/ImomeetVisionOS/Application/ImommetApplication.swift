//
//  ImomeetState.swift
//  ImomeetVision
//
//  Created by Thien Vu on 02/10/2023.
//

import Foundation
import SwiftUI

class ImommetApplication {
    static let shared = ImommetApplication()
    
    public func configuration() {
        SFUseCaseProvider.sharedInstance.registerUseCase()
    }
    
    public func performApplicationState(_ scene: ScenePhase) {
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
}
