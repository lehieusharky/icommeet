//
//  GetUserGroupTreeEntity.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class GetUserGroupTreeEntity: BaseEntity<GetUserGroupTreeModel> {
    override init(_ model: GetUserGroupTreeModel?) {
        super.init(model)
    }
    
    override init(_ error: XpertError?) {
        super.init(error)
    }
}
