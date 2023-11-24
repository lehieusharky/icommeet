//
//  Environments.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 14/10/2023.
//

import Foundation
import SwiftUI

struct BoolEnvironmentKey: EnvironmentKey {
    static var defaultValue: Bool { false }
}

extension EnvironmentValues {
    var firstLogin: Bool {
        get { self[BoolEnvironmentKey.self] }
        set { self[BoolEnvironmentKey.self] = newValue }
    }
}
