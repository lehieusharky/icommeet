//
//  SipServiceUseCase.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

class SipServiceUseCase {
    private(set) var repository: SipRepository
    
    init(repository: SipRepository) {
        self.repository = repository
    }
    
    func loginSIP() {
        repository.loginSIP()
    }
}
