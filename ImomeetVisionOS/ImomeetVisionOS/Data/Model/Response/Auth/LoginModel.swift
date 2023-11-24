//
//  LoginModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class LoginModel: Codable {
    public let c: Int?
    public let i: String?
    public let x: String?
    
    private enum CodingKeys: String, CodingKey {
        case c = "c"
        case i = "i"
        case x = "x"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.c = try? container.decodeIfPresent(Int.self, forKey: .c)
        self.i = try? container.decodeIfPresent(String.self, forKey: .i)
        self.x = try? container.decodeIfPresent(String.self, forKey: .x)
    }
    
    public var isLogin: Bool {
        return i == "Ok" && c == 0
    }
    
    public var errorX: XpertError? {
        guard !isLogin,
           let code = c,
           let descriptions = i else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
    
    public var accessToken: String? {
        return x
    }
}
