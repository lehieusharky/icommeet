//
//  SFUseCase.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

protocol SFUseCase {
    //MARK: - Login
    func authUsecase() -> AuthUseCase
    
    //MARK: - Contact
    func contactUsecase() -> ContactUseCase
    
    //MARK: - SIP
    func sipServiceUsecase() -> SipServiceUseCase
    
    //MARK: - Chat
    func chatServiceUsecase() -> ChatServiceUseCase
    
    //MARK: - App Version
    func appVersionUsecase() -> AppVersionUseCase
    
    //MARK: - MCU Meeting
    func mcuMeetingUsecase() -> MCUMeetingUseCase
    
    //MARK: - Translation
    func translationUsecase() -> TranslationUseCase
    
    //MARK: - User group
    func userGroupUsecase() -> UserGroupUseCase
    
    //MARK: - User Info
    func userUsecase() -> UserUseCase
}
