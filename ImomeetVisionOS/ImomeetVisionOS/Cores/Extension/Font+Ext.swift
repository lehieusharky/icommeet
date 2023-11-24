//
//  Font+Ext.swift
//  ImomeetVision
//
//  Created by Thien Vu on 02/10/2023.
//

import Foundation
import SwiftUI

extension Text {
    @inlinable func adjustedSystemFont(ofSize size:CGFloat) -> Text {
        return self.font(.system(size: size))
    }
    
    @inlinable func adjustedSystemFont(ofSize size:CGFloat, weight: Font.Weight) -> Text {
        return self.font(.system(size: size))
            .fontWeight(weight)
    }
    
    @inlinable func adjustedSystemFont(ofSize size:CGFloat, width: Font.Width) -> Text {
        return self.font(.system(size: size))
            .fontWidth(width)
    }
}
