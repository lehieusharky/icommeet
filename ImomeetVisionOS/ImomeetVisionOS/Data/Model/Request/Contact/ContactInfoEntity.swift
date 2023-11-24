//
//  ContactInfoEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

    protocol ContactInfoStateEntity {}

    class ContactInfoEntityFailure: ContactInfoStateEntity {
        private(set) var error: XpertError?
        
        init(error: XpertError? = nil) {
            self.error = error
        }
    }

    class ContactInfoEntity: ContactInfoStateEntity {
        private(set) var model: ContactInfoModel?
        
        init(_ model: ContactInfoModel?) {
            self.model = model
        }
    }
