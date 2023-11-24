//
//  MessageTranslationModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class MessageTranslationModel: Codable, Identifiable {
    public let type: String?
    public let service: String?
    public let version: String?
    public let result: ResultModel?
    
    private enum CodingKeys: String, CodingKey {
        case type = "@type"
        case service = "@service"
        case version = "@version"
        case result = "result"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try? container.decodeIfPresent(String.self, forKey: .type)
        self.service = try? container.decodeIfPresent(String.self, forKey: .service)
        self.version = try? container.decodeIfPresent(String.self, forKey: .version)
        self.result = try? container.decodeIfPresent(ResultModel.self, forKey: .result)

        
    }
}
