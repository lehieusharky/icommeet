//
//  CallControlProtocol.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import Foundation

protocol CallBottomActionProtocol {
    func onMute(_ state: Bool)
    func onCamera(_ state: Bool)
    func onExit()
}
