//
//  GetUserBasicInfoModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class GetUserBasicInfoModel: Codable, Identifiable {
    public let code: Int?
    public let msg: String?
    public let userId: String?
    public let accountName: String?
    public let userName: String?
    public let userTitle: String?
    public let userEmail: String?
    public let userPhone: String?
    public let userMobile: String?
    public let avatar: String?
    public let age: String?
    public let dob: String?
    public let gender: String?
    public let country: String?
    public let state: String?
    public let city: String?
    public let priority: String?
              
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case msg = "msg"
        case userId = "user_id"
        case accountName = "accountName"
        case userName = "user_name"
        case userTitle = "user_title"
        case userEmail = "user_email"
        case userPhone = "user_phone"
        case userMobile = "user_mobile"
        case avatar = "avatar"
        case age = "age"
        case dob = "dob"
        case gender = "gender"
        case country = "country"
        case state = "state"
        case city = "city"
        case priority = "priority"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
        self.userId = try? container.decodeIfPresent(String.self, forKey: .userId)
        self.accountName = try? container.decodeIfPresent(String.self, forKey: .accountName)
        self.userName = try? container.decodeIfPresent(String.self, forKey: .userName)
        self.userTitle = try? container.decodeIfPresent(String.self, forKey: .userTitle)
        self.userEmail = try? container.decodeIfPresent(String.self, forKey: .userEmail)
        self.userPhone = try? container.decodeIfPresent(String.self, forKey: .userPhone)
        self.userMobile = try? container.decodeIfPresent(String.self, forKey: .userMobile)
        self.avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)
        self.age = try? container.decodeIfPresent(String.self, forKey: .age)
        self.dob = try? container.decodeIfPresent(String.self, forKey: .dob)
        self.gender = try? container.decodeIfPresent(String.self, forKey: .gender)
        self.country = try? container.decodeIfPresent(String.self, forKey: .country)
        self.state = try? container.decodeIfPresent(String.self, forKey: .state)
        self.city = try? container.decodeIfPresent(String.self, forKey: .city)
        self.priority = try? container.decodeIfPresent(String.self, forKey: .priority)


        
    }
    
    public var isGetUserBasicInfoSuccess: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isGetUserBasicInfoSuccess,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
