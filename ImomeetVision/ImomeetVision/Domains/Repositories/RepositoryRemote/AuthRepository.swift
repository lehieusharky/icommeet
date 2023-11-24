//
//  LoginRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol AuthRepository {
    func loginWith(_ loginEntity: LoginRequestEntity) async throws -> Result<LoginModel?, XpertError>
    func logout(_ logoutEntity: LogoutRequestEntity,_ completion: @escaping (Result<LogoutModel, XpertError>) -> Void)
}
