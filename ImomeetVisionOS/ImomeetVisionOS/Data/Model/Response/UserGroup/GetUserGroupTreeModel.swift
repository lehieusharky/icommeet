//
//  GetUserGroupTreeModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class GetUserGroupTreeModel: Codable, Identifiable {
    public let code: Int?
    public let msg: String?
    public let myGroup: String?
    public let group: [SubGroupModel]?
              
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case msg = "msg"
        case myGroup = "my_group"
        case group = "group"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
        self.myGroup = try? container.decodeIfPresent(String.self, forKey: .myGroup)
        self.group = try? container.decodeIfPresent([SubGroupModel].self, forKey: .group)
    }
    
    public var isGetUserGroupTreeSuccess: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isGetUserGroupTreeSuccess,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
