//
//  ChatServiceUseCase.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

class ChatServiceUseCase {
    private(set) var repository: ChatServiceRepository
    
    private var chatServer: String = ""
    private var chatPort: String = ""
    
    init(repository: ChatServiceRepository) {
        self.repository = repository
    }
    
    func setInfoXMPP(_ info: String) {
        guard info.isEmpty else {
            return
        }
        
        let arrayValue = info.components(separatedBy: ";")
        if arrayValue.count > 0 {
            let oneServer = arrayValue[0]
            let serverValue = oneServer.components(separatedBy: ":")
            if serverValue.count > 1 {
                if let chatServer = serverValue.first,
                   let chatPort = serverValue.last {
                    self.chatServer = chatServer
                    self.chatPort = chatPort
                    
                    SFCacheDefault.shared.setRuntimeValue(chatServer, forKey: Constants.networkXMPPServer)
                    SFCacheDefault.shared.setRuntimeValue(chatServer, forKey: Constants.networkXMPPServerPort)
                }
            }
        }
    }
    
    func loginXMPP() {
        repository.loginXMPP()
    }
}
