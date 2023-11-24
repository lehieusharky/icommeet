//
//  ContactModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class ContactModel: Codable, Identifiable {
    public let userId: String?
    public let accountName: String?
    public let name: String?
    public let userTitle: String?
    public let userAlias: String?
    public let email: String?
    public let avatar: String?
    public let priority: Int?
    
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case accountName = "accountName"
        case name = "name"
        case userTitle = "user_title"
        case userAlias = "user_alias"
        case email = "email"
        case avatar = "avatar"
        case priority = "priority"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try? container.decodeIfPresent(String.self, forKey: .userId)
        self.accountName = try? container.decodeIfPresent(String.self, forKey: .accountName)
        self.name = try? container.decodeIfPresent(String.self, forKey: .name)
        self.userTitle = try? container.decodeIfPresent(String.self, forKey: .userTitle)
        self.userAlias = try? container.decodeIfPresent(String.self, forKey: .userAlias)
        self.email = try? container.decodeIfPresent(String.self, forKey: .email)
        self.avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)
        self.priority = try? container.decodeIfPresent(Int.self, forKey: .priority)
    }
}
