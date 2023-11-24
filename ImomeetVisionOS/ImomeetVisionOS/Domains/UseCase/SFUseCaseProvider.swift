//
//  SFUseCaseProvider.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import Foundation

class SFUseCaseProvider: SFUseCase {
    static let sharedInstance = SFUseCaseProvider()
    
    private(set) var useCaseStore: StoreInterface
    private let sfRepository: SFRepository
    
    private init() {
        useCaseStore = Store()
        sfRepository = SFRepositoryProvider()
    }
    
    public func registerUseCase() {
        useCaseStore.register(AuthUseCase.self) {
            self.authUsecase()
        }
        
        useCaseStore.register(ContactUseCase.self) {
            self.contactUsecase()
        }
        
        useCaseStore.register(MCUMeetingUseCase.self) {
            self.mcuMeetingUsecase()
        }
        
        useCaseStore.register(ChatServiceUseCase.self) {
            self.chatServiceUsecase()
        }
    }
}

//MARK: - Remote Use Case
extension SFUseCaseProvider {
    func authUsecase() -> AuthUseCase {
        let repository = sfRepository.loginRepository()
        return AuthUseCase(repository: repository)
    }
    
    func contactUsecase() -> ContactUseCase {
        let repository = sfRepository.contactRepository()
        return ContactUseCase(contactRepository: repository)
    }
    
    func sipServiceUsecase() -> SipServiceUseCase {
        let repository = sfRepository.sipServiceRepository()
        return SipServiceUseCase(repository: repository)
    }
    
    func chatServiceUsecase() -> ChatServiceUseCase {
        let repository = sfRepository.chatServiceRepository()
        return ChatServiceUseCase(repository: repository)
    }
    
    func appVersionUsecase() -> AppVersionUseCase {
        let repository = sfRepository.appVersionRepository()
        return AppVersionUseCase(repository: repository)
    }
    
    func mcuMeetingUsecase() -> MCUMeetingUseCase {
        let repository = sfRepository.mcuMeetingRepository()
        return MCUMeetingUseCase(repository: repository)
    }
    
    func translationUsecase() -> TranslationUseCase {
        let repository = sfRepository.translationRepository()
        return TranslationUseCase(repository: repository)
    }
    
    func userGroupUsecase() -> UserGroupUseCase {
        let repository = sfRepository.userGroupRepository()
        return UserGroupUseCase(repository: repository)
    }
    
    func userUsecase() -> UserUseCase {
        let repository = sfRepository.userRepository()
        return UserUseCase(repository: repository)
    }
}
