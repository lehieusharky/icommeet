//
//  SipServiceRepositoryImpl.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

class SipServiceRepositoryImpl: SipRepository {
    private(set) var dataSource: SipServiceDataSource?
    
    init(dataSource: SipServiceDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func loginSIP() {
        //
    }
}
