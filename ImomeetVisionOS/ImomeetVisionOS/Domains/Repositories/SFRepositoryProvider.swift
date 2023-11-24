//
//  SFRepositoryProvider.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import Foundation

class SFRepositoryProvider {
    private let loginDataSource: AuthDataSource
    private let contactDataSource: ContactDataSource
    private let sipServiceDataSource: SipServiceDataSource
    private let charServiceDataSource: ChatServiceDataSource
    private let appVersionDataSource: AppVersionDataSource
    private let mcuMeetingDataSource: MCUMeetingDataSource
    private let translationDataSource: TranslationDataSource
    private let userGroupDataSource: UserGroupDataSource
    private let userDataSource: UserDataSource
    
    init() {
        loginDataSource         = AuthDataSourceAPIImpl()
        contactDataSource       = ContactDataSourceAPIImpl()
        sipServiceDataSource    = SipServiceDataSourceImpl()
        charServiceDataSource   = ChatServiceDataSourceImpl()
        appVersionDataSource    = AppVersionDataSourceAPIImpl()
        mcuMeetingDataSource    = MCUMeetingDataSourceAPIImpl()
        translationDataSource   = TranslationDataSourceAPIImpl()
        userGroupDataSource     = UserGroupDataSourceAPIImpl()
        userDataSource          = UserDataSourceAPIImpl()
    }
}

extension SFRepositoryProvider: SFRepository {
    func loginRepository() -> AuthRepository {
        return AuthRepositoryImpl(dataSource: loginDataSource)
    }
    
    func contactRepository() -> ContactRepository {
        return ContactRepositoryImpl(dataSource: contactDataSource)
    }
    
    func sipServiceRepository() -> SipRepository {
        return SipServiceRepositoryImpl(dataSource: sipServiceDataSource)
    }
    
    func chatServiceRepository() -> ChatServiceRepository {
         return ChatServiceRepositoryImpl(dataSource: charServiceDataSource)
    }
    
    func appVersionRepository() -> AppVersionRepository {
        return AppVersionRepositoryImpl(dataSource: appVersionDataSource)
    }
    
    func mcuMeetingRepository() -> MCUMeetingRepository {
        return MCUMeetingRepositoryImpl(dataSource: mcuMeetingDataSource)
    }
    
    func translationRepository() -> TranslationRepository {
        return TranslationRepositoryImpl(dataSource: translationDataSource)
    }
    
    func userGroupRepository() -> UserGroupRepository {
        return UserGroupRepositoryImpl(dataSource: userGroupDataSource)
    }
    
    func userRepository() -> UserRepository {
        return UserRepositoryImpl(dataSource: userDataSource)
    }
}
