//
//  ExtendOnGoingMCUMeetingTimeModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class ExtendOnGoingMCUMeetingTimeModel: Codable, Identifiable {
    public let code: Int?
    public let err: Int?
    public let result: String?

    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case err = "err"
        case result = "result"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.err = try? container.decodeIfPresent(Int.self, forKey: .err)
        self.result = try? container.decodeIfPresent(String.self, forKey: .result)

        
    }
    
    public var isExtendOnGoingMCUMeetingTimeSuccess: Bool {
        return result == "Done" && code == 1 && err == 0
    }
    
    public var errorX: XpertError? {
        guard !isExtendOnGoingMCUMeetingTimeSuccess,
           let code = code,
           let descriptions = result else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
