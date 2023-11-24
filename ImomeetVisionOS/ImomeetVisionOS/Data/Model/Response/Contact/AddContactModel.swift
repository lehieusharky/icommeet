//
//  AddContactModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class AddContactModel: Codable, Identifiable { 
    public let code: Int?
    public let info: String?
    public let contacts: [AddContactInfoModel]?

    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case info = "info"
        case contacts = "contacts"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.info = try? container.decodeIfPresent(String.self, forKey: .info)
        self.contacts = try? container.decodeIfPresent([AddContactInfoModel].self, forKey: .contacts)

        
    }

    public var isAddContactSuccess: Bool {
        return info == "Ok" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isAddContactSuccess,
           let code = code,
           let descriptions = info else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}