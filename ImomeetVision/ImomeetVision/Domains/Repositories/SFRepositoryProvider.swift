//
//  SFRepositoryProvider.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import Foundation

class SFRepositoryProvider: SFRepository {
    private var loginDataSource: AuthDataSource = AuthDataSourceAPIImpl()
    
    func loginRepository() -> AuthRepository {
        return AuthRepositoryImpl(dataSource: loginDataSource)
    }
}
