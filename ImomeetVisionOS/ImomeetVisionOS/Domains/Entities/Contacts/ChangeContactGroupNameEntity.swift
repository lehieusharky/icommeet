//
//  ChangeContactGroupNameEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol ChangeContactGroupNameStateEntity {}

class ChangeContactGroupNameEntityFailure: ChangeContactGroupNameStateEntity {
    private(set) var error: XpertError?
    
    init(error: XpertError? = nil) {
        self.error = error
    }
}

class ChangeContactGroupNameEntity: ChangeContactGroupNameStateEntity {
    private(set) var model: ChangeContactGroupNameModel?
    
    init(_ model: ChangeContactGroupNameModel?) {
        self.model = model
    }
}
