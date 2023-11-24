//
//  ChatServiceRepositoryImpl.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

class ChatServiceRepositoryImpl: ChatServiceRepository {
    
    private(set) var dataSource: ChatServiceDataSource?
    
    init(dataSource: ChatServiceDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func loginXMPP() {
        //
    }
}
