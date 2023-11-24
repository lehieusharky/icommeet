//
//  SFResult.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

public enum SFResult<Success, Failure> {
    case success(Success)
    case failure(Failure)
}
