//
//  SubGroupModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class SubGroupModel: Codable, Identifiable {
    public let groupId: String?
    public let groupName: String?
    public let priority: String?
    public let subGroup: [SubGroupModel]?
    public let groupUsers: GroupUserModel?
              
    private enum CodingKeys: String, CodingKey {
        case groupId = "group_id"
        case groupName = "group_name"
        case priority = "priority"
        case subGroup = "sub_group"
        case groupUsers = "group_users"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.groupId = try? container.decodeIfPresent(String.self, forKey: .groupId)
        self.groupName = try? container.decodeIfPresent(String.self, forKey: .groupName)
        self.priority = try? container.decodeIfPresent(String.self, forKey: .priority)
        self.subGroup = try? container.decodeIfPresent([SubGroupModel].self, forKey: .subGroup)
        self.groupUsers = try? container.decodeIfPresent(GroupUserModel.self, forKey: .groupUsers)

        
    }
}
