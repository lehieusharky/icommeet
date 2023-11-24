//
//  UserDataSource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol UserDataSource {
    func getUserBasicInfo(_ request: GetUserBasicInfoRequest) async throws -> Result<GetUserBasicInfoModel?, XpertError>
    func updateUserBasicInfo(_ request: UpdateUserBasicInfoRequest) async throws -> Result<UpdateUserBasicInfoModel?, XpertError>
    func changeUserPassword(_ request: ChangeUserPasswordRequest) async throws -> Result<ChangeUserPasswordModel?, XpertError>
    func getUserList(_ request: GetUserListRequest) async throws -> Result<GetUserListModel?, XpertError>
    func updateRemoveUserAvatar(_ request: UpdateRemoveUserAvatarRequest) async throws -> Result<UpdateRemoveUserAvatarModel?, XpertError>

}

class UserDataSourceAPIImpl: UserDataSource {
    func getUserBasicInfo(_ request: GetUserBasicInfoRequest) async throws -> Result<GetUserBasicInfoModel?, XpertError> {
        let getUserBasicInfoPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: getUserBasicInfoPath) else {
            return .failure(XpertError(.error_100))
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: request.toDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let getUserBasicInfoData = try? decoder.decode(GetUserBasicInfoModel.self, from: data)
                return .success(getUserBasicInfoData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func updateUserBasicInfo(_ request: UpdateUserBasicInfoRequest) async throws -> Result<UpdateUserBasicInfoModel?, XpertError> {
        let updateUserBasicInfoPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: updateUserBasicInfoPath) else {
            return .failure(XpertError(.error_100))
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: request.toDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let updateUserBasicInfoData = try? decoder.decode(UpdateUserBasicInfoModel.self, from: data)
                return .success(updateUserBasicInfoData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
    

    func changeUserPassword(_ request: ChangeUserPasswordRequest) async throws -> Result<ChangeUserPasswordModel?, XpertError> {
        let changeUserPasswordPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: changeUserPasswordPath) else {
            return .failure(XpertError(.error_100))
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: request.toDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let changeUserPassswordData = try? decoder.decode(ChangeUserPasswordModel.self, from: data)
                return .success(changeUserPassswordData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func getUserList(_ request: GetUserListRequest) async throws -> Result<GetUserListModel?, XpertError> {
        let getUserListPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: getUserListPath) else {
            return .failure(XpertError(.error_100))
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: request.toDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let getUserListData = try? decoder.decode(GetUserListModel.self, from: data)
                return .success(getUserListData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

     func updateRemoveUserAvatar(_ request: UpdateRemoveUserAvatarRequest) async throws -> Result<UpdateRemoveUserAvatarModel?, XpertError> {
        let updateRemoveUserAvatarPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: updateRemoveUserAvatarPath) else {
            return .failure(XpertError(.error_100))
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: request.toDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let updateRemoveUserAvatarData = try? decoder.decode(UpdateRemoveUserAvatarModel.self, from: data)
                return .success(updateRemoveUserAvatarData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
     }
}
