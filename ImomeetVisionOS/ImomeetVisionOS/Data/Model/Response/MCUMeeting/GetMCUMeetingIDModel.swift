//
//  GetMCUMeetingIDModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class GetMCUMeetingIDModel: Codable, Identifiable {
    public let code: Int?
    public let msg: String?
    public let meetingId: String?
    public let meetingStatus: String?
    public let mcuId: String?

    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case msg = "msg"
        case meetingId = "meeting_id"
        case meetingStatus = "meeting_status"
        case mcuId = "mcu_id"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.msg = try? container.decodeIfPresent(String.self, forKey: .msg)
        self.meetingId = try? container.decodeIfPresent(String.self, forKey: .meetingId)
        self.meetingStatus = try? container.decodeIfPresent(String.self, forKey: .meetingStatus)
        self.mcuId = try? container.decodeIfPresent(String.self, forKey: .mcuId)

        
    }
    
    public var isGetMCUMeetingID: Bool {
        return msg == "Done" && code == 1
    }
    
    public var errorX: XpertError? {
        guard !isGetMCUMeetingID,
           let code = code,
           let descriptions = msg else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
