//
//  ContactFromGetUserListModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class ContactFromGetUserListModel: Codable, Identifiable {
    public let userId: String?
    public let userNameExt: String?
    public let userEmail: String?
    public let userPhone: String?
    public let userMobile: String?
    public let userTitle: String?
    public let avatar: String?
    public let gender: String?
    public let startDate: String?
    public let expiryDate: String?
    public let groupName: String?
    public let groupId: String?
              
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case userNameExt = "user_name_ext"
        case userEmail = "user_email"
        case userPhone = "user_phone"
        case userMobile = "user_mobile"
        case userTitle = "user_title"
        case avatar = "avatar"
        case gender = "gender"
        case startDate = "start_date"
        case expiryDate = "expiry_date"
        case groupName = "group_name"
        case groupId = "group_id"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try? container.decodeIfPresent(String.self, forKey: .userId)
        self.userNameExt = try? container.decodeIfPresent(String.self, forKey: .userNameExt)
        self.userEmail = try? container.decodeIfPresent(String.self, forKey: .userEmail)
        self.userPhone = try? container.decodeIfPresent(String.self, forKey: .userPhone)
        self.userMobile = try? container.decodeIfPresent(String.self, forKey: .userMobile)
        self.userTitle = try? container.decodeIfPresent(String.self, forKey: .userTitle)
        self.avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)
        self.gender = try? container.decodeIfPresent(String.self, forKey: .gender)
        self.startDate = try? container.decodeIfPresent(String.self, forKey: .startDate)
        self.expiryDate = try? container.decodeIfPresent(String.self, forKey: .expiryDate)
        self.groupName = try? container.decodeIfPresent(String.self, forKey: .groupName)
        self.groupId = try? container.decodeIfPresent(String.self, forKey: .groupId)

        
    }
  
}
