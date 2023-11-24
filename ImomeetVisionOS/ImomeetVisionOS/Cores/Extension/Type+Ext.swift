//
//  Extension.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 30/10/2023.
//

import Foundation

typealias CodingObject = NSObject & NSCoding

protocol ModeOnOff: Identifiable {
    associatedtype Item
    
    var isOn: Bool { get set }
    var item: Item { get }
}
