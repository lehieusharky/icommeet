
//
//  UpdateRemoveUserAvatarModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class UpdateRemoveUserAvatarModel: Codable, Identifiable {
    public let code: Int?
    public let msg: String?
    public let avatar: String?
              
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case msg = "msg"
        case avatar = "avatar"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
        self.avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)

        
    }
    
    public var isUpdateRemoveUserAvatarSuccess: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isUpdateRemoveUserAvatarSuccess,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
