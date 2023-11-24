//
//  ChangeContactGroupNameModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class ChangeContactGroupNameModel: Codable, Identifiable { 
    public let code: Int?
    public let info: String?

    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case info = "info"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.info = try? container.decodeIfPresent(String.self, forKey: .info)

        
    }
    
    public var isChangeContactGroupNameSuccess: Bool {
        return info == "Ok" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isChangeContactGroupNameSuccess,
           let code = code,
           let descriptions = info else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}