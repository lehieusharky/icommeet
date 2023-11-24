//
//  LogoutModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class LogoutModel: CommonAPI {
    private let c: Int?
    private let i: String?
    
    private enum CodingKeys: String, CodingKey {
        case c = "c"
        case i = "i"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.c = try? container.decodeIfPresent(Int.self, forKey: .c)
        self.i = try? container.decodeIfPresent(String.self, forKey: .i)
        try super.init(from: decoder)
    }
    
    public var isLogout: Bool {
        return i == "Ok" && c == 0
    }
    
    public var errorX: XpertError? {
        guard !isLogout,
           let code = c,
           let descriptions = i else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
