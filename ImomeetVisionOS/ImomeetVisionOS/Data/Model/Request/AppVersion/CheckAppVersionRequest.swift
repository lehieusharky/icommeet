//
//  CheckAppVersionRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class CheckAppVersionRequest {
    var x : String
    var name : String
    var lang : String?
    var verMajor : String?
    var verMinor : String?
    var verBuild : String?
    var accessToken: String?
    
    init(x: String,
         name: String,
         lang: String,
         verMajor: String,
         verMinor: String,
         verBuild: String,
         accessToken: String) {
        self.x = x
        self.name = x
        self.lang = lang
        self.verMajor = verMajor
        self.verMinor = verMinor
        self.verBuild = verBuild
        self.accessToken = accessToken
    }
}
