//
//  ChatServiceRepository.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

protocol ChatServiceRepository {
    var dataSource: ChatServiceDataSource? { get }
    
    func loginXMPP()
}
