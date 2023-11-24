//
//  BaseEntity.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 22/10/2023.
//

import Foundation

class BaseEntity<T> {
    private(set) var model: T? = nil
    private(set) var error: XpertError? = nil
    
    init(_ model: T?) {
        self.model = model
    }
    
    init(_ error: XpertError?) {
        self.error = error
    }
}
