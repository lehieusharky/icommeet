//
//  SFRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import Foundation

protocol SFRepository {
    func loginRepository() -> AuthRepository
    func contactRepository() -> ContactRepository
    func sipServiceRepository() -> SipRepository
    func chatServiceRepository() -> ChatServiceRepository
    func appVersionRepository() -> AppVersionRepository
    func mcuMeetingRepository() -> MCUMeetingRepository
    func translationRepository() -> TranslationRepository
    func userGroupRepository() -> UserGroupRepository
    func userRepository() -> UserRepository
}
