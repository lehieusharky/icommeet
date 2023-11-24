//
//  InputTranslationRequestEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class InputTranslationRequest {
    var x : String
    var source: String?
    var target: String
    var text: String
    
    init(x: String,
         source: String,
         target: String,
         text: String) {
        self.x = x
        self.source = source
        self.target = target
        self.text = text
    }
}
