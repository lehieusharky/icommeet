//
//  AddContactInfoModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class AddContactInfoModel: Codable, Identifiable { 
    public let userId: String?
    public let name: String?
    public let userTitle: String?
    public let email: String?
    public let avatar: String?
   
    
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name = "name"
        case userTitle = "user_title"
        case email = "email"
        case avatar = "avatar"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try? container.decodeIfPresent(String.self, forKey: .userId)
        self.name = try? container.decodeIfPresent(String.self, forKey: .name)
        self.userTitle = try? container.decodeIfPresent(String.self, forKey: .userTitle)
        self.email = try? container.decodeIfPresent(String.self, forKey: .email)
        self.avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)
   
        
    }
}