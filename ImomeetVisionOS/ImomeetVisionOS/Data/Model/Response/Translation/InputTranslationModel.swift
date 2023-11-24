//
//  InputTranslationModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class InputTranslationModel: Codable, Identifiable {
    public let message: MessageTranslationModel?
    
    private enum CodingKeys: String, CodingKey {
        case message = "message"

    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try? container.decodeIfPresent(MessageTranslationModel.self, forKey: .message)
    }
    
    public var isInputTranslationSuccess: Bool {
        return true
    }
}
