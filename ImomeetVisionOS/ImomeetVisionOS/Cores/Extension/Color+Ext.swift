//
//  Color+Extension.swift
//  ImomeetVision
//
//  Created by Thien Vu on 26/09/2023.
//

import Foundation
import SwiftUI

extension Color {
    static func colorFromHex(_ hex: String) -> Color? {
        if hex.hasPrefix("#") {
            let r, g, b, a: CGFloat

            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...])

            if hexColor.count == 6 {
                hexColor.append("FF")
            }
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    return Color(red: r, green: g, blue: b, opacity: a)
                }
            }
        } else {
            return colorFromHex("#\(hex)")
        }
        
        return nil
    }
}
