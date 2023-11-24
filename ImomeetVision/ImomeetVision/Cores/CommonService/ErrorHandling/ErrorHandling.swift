//
//  ErrorHandling.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class XpertError: Error {
    
    private(set) var code: Int
    
    private var description: String
    
    init(_ code: ErrorMapping) {
        self.code = code.rawValue
        self.description = code.description
    }
    
    init(_ code: Int, description: String) {
        self.code = code
        self.description = description
    }
    
    init(_ description: String) {
        self.code = -1000
        self.description = description
    }
    
    static func exeption() -> XpertError {
        return XpertError(.error_100)
    }
    
    public var descriptionError: String {
        if let mapping = ErrorMapping(rawValue: code) {
            return mapping.description
        }
        
        return description
    }
    
    public var errorCode: Int {
        return self.code
    }
}
