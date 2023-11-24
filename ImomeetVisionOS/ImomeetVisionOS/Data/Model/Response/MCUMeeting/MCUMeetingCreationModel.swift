
//
//  MCUMeetingCreationModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class MCUMeetingCreationModel: Codable, Identifiable {
    public let code: Int?
    public let err: String?
    public let meetingId: String?
    public let sessionId: String?
    public let meeting: String?
    public let result: String?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case err = "err"
        case meetingId = "meeting_id"
        case sessionId = "session_id"
        case meeting = "meeting"
        case result = "result"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.err = try? container.decodeIfPresent(String.self, forKey: .err)
        self.meetingId = try? container.decodeIfPresent(String.self, forKey: .meetingId)
        self.sessionId = try? container.decodeIfPresent(String.self, forKey: .sessionId)
        self.meeting = try? container.decodeIfPresent(String.self, forKey: .meeting)
        self.result = try? container.decodeIfPresent(String.self, forKey: .result)
    }
    
    public var isMCUMeetingCreationSuccess: Bool {
        return  code == 1 &&  result == "OK"
    }
}
