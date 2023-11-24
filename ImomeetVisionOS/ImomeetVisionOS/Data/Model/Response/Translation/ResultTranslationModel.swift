//
//  ResultModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class ResultModel: Codable, Identifiable {
    public let translatedText: String?
    
    private enum CodingKeys: String, CodingKey {
        case translatedText = "translatedText"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.translatedText = try? container.decodeIfPresent(String.self, forKey: .translatedText)

        
    }
}
