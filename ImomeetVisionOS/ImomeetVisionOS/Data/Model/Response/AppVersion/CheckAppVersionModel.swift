//
//  CheckAppVersionModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation
    
class CheckAppVersionModel: Codable, Identifiable {
    public let code: Int?
    public let uptodate: String?
    public let ver: String?
    public let size: String?
    public let url: String?
    public let changes: String?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case uptodate = "uptodate"
        case ver = "ver"
        case size = "size"
        case url = "url"
        case changes = "changes"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try? container.decodeIfPresent(Int.self, forKey: .code)
        self.uptodate = try? container.decodeIfPresent(String.self, forKey: .uptodate)
        self.ver = try? container.decodeIfPresent(String.self, forKey: .ver)
        self.size = try? container.decodeIfPresent(String.self, forKey: .size)
        self.url = try? container.decodeIfPresent(String.self, forKey: .url)
        self.changes = try? container.decodeIfPresent(String.self, forKey: .changes)

        
    }
    
    public var isCheckAppVersionSuccess: Bool {
        return code == 1
    }
    
    public var errorX: XpertError? {
        guard !isCheckAppVersionSuccess,
           let code = code,
           let descriptions = ver else {
            return nil
        }
        
        return XpertError(code, description: descriptions)
    }
}
