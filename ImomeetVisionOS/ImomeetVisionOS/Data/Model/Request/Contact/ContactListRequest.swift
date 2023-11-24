//
//  ContactListRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class ContactListRequest {
    var x: String = "3040"
    var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func toBodyString() -> String {
        return "x=\(x)&user_id=\(userId)"
    }
}
