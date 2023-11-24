//
//  ContactItem.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 19/10/2023.
//

import Foundation
import SwiftUI

class ContactTitleItem: Identifiable {
    
    private(set) var model: ContactModel
    private(set) var backgroundColor: ThemeColorPicker
    
    init(model: ContactModel,
         backgroundColor: ThemeColorPicker = ThemeColorPicker(staticValue: Color.clear)) {
        self.model = model
        self.backgroundColor = backgroundColor
    }
    
    public var name: String {
        return model.name ?? ""
    }
    
    public var userId: String {
        return model.userId ?? ""
    }
    
    public var imageUrl: String {
        return model.avatar ?? ""
    }
}
