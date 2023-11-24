//
//  ErrorMapping.swift
//  ImomeetVision
//
//  Created by Thien Vu on 26/09/2023.
//

import Foundation

enum ErrorMapping: Int {
    case error_100 = 100
    case error_101 = 200
    case error_102 = 300
    case error_103 = 400
    case error_500 = 500
    case error_1000 = 1000
    case error_2000 = 2000
    case error_2500 = 2500
    case error_3000 = 3000
    case error_4000 = 4000
    case error_9000 = 9000
    
    public var description: String {
        switch self {
        case .error_100:
            return "Invalid cipher context"
        case .error_101:
            return "Invalid verify code"
        case .error_102:
            return "Invalid user ID/password or Invalid SMS code"
        case .error_103:
            return "User ID not exists"
        case .error_500:
            return "Invalid access token"
        case .error_1000:
            return "Third-party auth gateway not available"
        case .error_2000:
            return "Access denied"
        case .error_2500:
            return "User APP has been out-of-date"
        case .error_3000:
            return "Failed to access"
        case .error_4000:
            return "Invalid response"
        default:
            return "Error"
        }
    }
}
