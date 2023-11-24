//
//  ContactListModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class ContactListModel: Codable, Identifiable {
    public let code: Int?
    public let info: String?
    public let groupNum: Int?
    public let groupContacts: [GroupContactModel]?
    public let total: Int?
    public let contacts: [ContactModel]?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case info = "info"
        case groupNum = "groupNum"
        case groupContacts = "groupContacts"
        case total = "total"
        case contacts = "contacts"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.info = try? container.decodeIfPresent(String.self, forKey: .info)
        self.groupNum = try? container.decodeIfPresent(Int.self, forKey: .groupNum)
        self.groupContacts = try? container.decodeIfPresent([GroupContactModel].self, forKey: .groupContacts)
        self.total = try? container.decodeIfPresent(Int.self, forKey: .total)
        self.contacts = try? container.decodeIfPresent([ContactModel].self, forKey: .contacts)
    }
}
