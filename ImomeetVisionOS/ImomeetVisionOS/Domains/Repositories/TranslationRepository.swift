//
//  TranslationRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol TranslationRepository {
    func inputTranslation(_ inputTranslationEntity: InputTranslationRequest) async throws -> Result<InputTranslationModel?, XpertError>

}
