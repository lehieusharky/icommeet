//
//  AddContactEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

    protocol AddContactStateEntity {}

    class AddContactEntityFailure: AddContactStateEntity {
        private(set) var error: XpertError?
        
        init(error: XpertError? = nil) {
            self.error = error
        }
    }

    class AddContactEntity: AddContactStateEntity {
        private(set) var model: AddContactModel?
        
        init(_ model: AddContactModel?) {
            self.model = model
        }
    }
