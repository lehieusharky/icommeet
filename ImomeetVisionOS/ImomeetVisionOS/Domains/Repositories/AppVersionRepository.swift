//
//  AppVersionRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol AppVersionRepository {
    func checkAppVersion(_ checkAppVersionEntity: CheckAppVersionRequest) async throws -> Result<CheckAppVersionModel?, XpertError>

}

