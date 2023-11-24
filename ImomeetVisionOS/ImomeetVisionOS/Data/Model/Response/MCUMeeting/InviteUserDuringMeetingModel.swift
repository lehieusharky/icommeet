//
//  InviteUserDuringMeetingModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class InviteUserDuringMeetingModel: Codable, Identifiable {
    public let code: Int?
    public let msg: String?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case msg = "msg"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
    }
    
    public var isInviteUserDuringMeetingSuccess: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isInviteUserDuringMeetingSuccess,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
