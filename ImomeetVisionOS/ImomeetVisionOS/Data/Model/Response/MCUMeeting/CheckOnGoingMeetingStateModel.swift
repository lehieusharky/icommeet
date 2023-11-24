
//
//  CheckOnGoingMeetingStateModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class CheckOnGoingMeetingStateModel: Codable, Identifiable {
    public let code: Int?
    public let meeting: Int?
    public let msg: String?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case meeting = "meeting"
        case msg = "msg"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.meeting = try? container.decodeIfPresent(Int.self, forKey: .meeting)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
    }
    
    public var isCheckOnGoingMeetingStateSuccess: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isCheckOnGoingMeetingStateSuccess,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
