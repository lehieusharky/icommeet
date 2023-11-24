//
//  ParticipantModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class ParticipantModel: Codable, Identifiable {
    public let accountName: String?
    public let avatar: String?
    public let email: String?
    public let id: Int?
    public let name: String?
    public let roleId: Int?
    public let title: String?
    public let uidType: Int?

    
    private enum CodingKeys: String, CodingKey {
        case accountName = "accountName"
        case avatar = "avatar"
        case email = "email"
        case id = "id"
        case name = "name"
        case roleId = "role_id"
        case title = "title"
        case uidType = "uid_type"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountName = try? container.decodeIfPresent(String.self, forKey: .accountName)
        self.avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)
        self.email = try? container.decodeIfPresent(String.self, forKey: .email)
        self.id = try? container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try? container.decodeIfPresent(String.self, forKey: .name)
        self.roleId = try? container.decodeIfPresent(Int.self, forKey: .roleId)
        self.title = try? container.decodeIfPresent(String.self, forKey: .title)
        self.uidType = try? container.decodeIfPresent(Int.self, forKey: .uidType)
    }
}
