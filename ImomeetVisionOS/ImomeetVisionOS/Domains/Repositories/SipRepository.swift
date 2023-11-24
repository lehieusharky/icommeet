//
//  SipRepository.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

protocol SipRepository {
    var dataSource: SipServiceDataSource? { get }
    
    func loginSIP()
}
