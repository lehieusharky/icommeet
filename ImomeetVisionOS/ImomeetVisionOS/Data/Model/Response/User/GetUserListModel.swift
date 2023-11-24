//
//  GetUserListModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class GetUserListModel: Codable, Identifiable {
    public let code: Int?
    public let msg: String?
    public let total: String?
    public let num: String?
    public let from: String?
    public let contacts: [ContactFromGetUserListModel]?
              
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case msg = "msg"
        case total = "total"
        case num = "num"
        case from = "from"
        case contacts = "contacts"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
        self.total = try? container.decodeIfPresent(String.self, forKey: .total)
        self.num = try? container.decodeIfPresent(String.self, forKey: .num)
        self.from = try? container.decodeIfPresent(String.self, forKey: .from)
        self.contacts = try? container.decodeIfPresent([ContactFromGetUserListModel].self, forKey: .contacts)
    }
    
    public var isGetUserListSuccess: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isGetUserListSuccess,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
