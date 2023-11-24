//
//  GroupUserModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class GroupUserModel: Codable, Identifiable {
    public let total: String?
    public let users: [DetailGroupUserInfoModel]?
              
    private enum CodingKeys: String, CodingKey {
        case total = "total"
        case users = "users"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try? container.decodeIfPresent(String.self, forKey: .total)
        self.users = try? container.decodeIfPresent([DetailGroupUserInfoModel].self, forKey: .users)

        
    }
}
