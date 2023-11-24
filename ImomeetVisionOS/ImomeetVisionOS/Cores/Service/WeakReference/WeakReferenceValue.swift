//
//  WeakReferenceValue.swift
//  ImomeetVision
//
//  Created by Thien Vu on 27/09/2023.
//

import Foundation

public class WeakReferenceObserver<T> {
    public var value: T? {
        return abstractValue as? T
    }

    public init( value: T ) {
        abstractValue = value as AnyObject
    }

    private weak var abstractValue: AnyObject?
}
