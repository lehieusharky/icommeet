//
//  LoginNavigator.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 15/11/2023.
//

import Foundation
import SwiftUI

enum LoginNavigateDirection: String {
    case networkSetting = "networkSetting"
}

protocol LoginNavigatorProtocol: ObservableObject {
    var path: NavigationPath { get }
    func gotoNetworkSetting()
}

class LoginNavigator: LoginNavigatorProtocol {
    @Published var path: NavigationPath
    
    init() {
        self.path = NavigationPath()
    }
    
    func gotoNetworkSetting() {
        path.append(LoginNavigateDirection.networkSetting.rawValue)
    }
}
