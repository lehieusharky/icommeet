//
//  GetGroupUserModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class GetGroupUserModel: Codable, Identifiable {
    public let code: Int?
    public let msg: String?
    public let total: String?
    public let groupUsers: [DetailGroupUserInfoModel]?
              
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case msg = "msg"
        case total = "total"
        case groupUsers = "group_users"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
        self.total = try? container.decodeIfPresent(String.self, forKey: .total)
        self.groupUsers = try? container.decodeIfPresent([DetailGroupUserInfoModel].self, forKey: .groupUsers)

        
    }
    
    public var isGetGroupUserSuccess: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isGetGroupUserSuccess,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
