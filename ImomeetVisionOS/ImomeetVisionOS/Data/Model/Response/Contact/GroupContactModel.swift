//
//  GroupContactModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class GroupContactModel: Codable, Identifiable {
    private let group: String?
    private let groupId: String?
    private let total: Int?
    private let contacts: [ContactModel]?
   
    
    private enum CodingKeys: String, CodingKey {
        case group = "group"
        case groupId = "groupId"
        case total = "total"
        case contacts = "contacts"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.group = try? container.decodeIfPresent(String.self, forKey: .group)
        self.groupId = try? container.decodeIfPresent(String.self, forKey: .groupId)
        self.total = try? container.decodeIfPresent(Int.self, forKey: .total)
        self.contacts = try? container.decodeIfPresent([ContactModel].self, forKey: .contacts)
    }
}
