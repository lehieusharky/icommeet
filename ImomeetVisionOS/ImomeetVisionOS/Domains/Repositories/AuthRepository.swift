//
//  LoginRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol AuthRepository {
    var dataSource: AuthDataSource? { get }
    
    func loginWith(_ loginEntity: LoginRequest) async throws -> Result<LoginModel, XpertError>
    func logout(_ logoutEntity: LogoutRequest,_ completion: @escaping (Result<LogoutModel, XpertError>) -> Void)
}
