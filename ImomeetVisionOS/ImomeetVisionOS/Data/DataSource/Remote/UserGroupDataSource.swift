//
//  UserGroupDataSource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol UserGroupDataSource {
    func getUserGroupTree(_ request: GetUserGroupTreeRequest) async throws -> Result<GetUserGroupTreeModel?, XpertError>
    func getUserGroupTree2(_ request: GetUserGroupTree2Request) async throws -> Result<GetUserGroupTree2Model?, XpertError>
    func getGroupUser(_ request: GetGroupUserRequest) async throws -> Result<GetGroupUserModel?, XpertError>
    
}

class UserGroupDataSourceAPIImpl: UserGroupDataSource {
    func getUserGroupTree(_ request: GetUserGroupTreeRequest) async throws -> Result<GetUserGroupTreeModel?, XpertError> {
        let getUserGroupTreePath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: getUserGroupTreePath) else {
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
                let getUserGroupTreeData = try? decoder.decode(GetUserGroupTreeModel.self, from: data)
                return .success(getUserGroupTreeData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func getUserGroupTree2(_ request: GetUserGroupTree2Request) async throws -> Result<GetUserGroupTree2Model?, XpertError> {
        let getUserGroupTreePath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: getUserGroupTreePath) else {
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
                let getUserGroupTree2Data = try? decoder.decode(GetUserGroupTree2Model.self, from: data)
                return .success(getUserGroupTree2Data)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }


    func getGroupUser(_ request: GetGroupUserRequest) async throws -> Result<GetGroupUserModel?, XpertError> {
        let getGroupUserPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: getGroupUserPath) else {
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
                let getGroupUserData = try? decoder.decode(GetGroupUserModel.self, from: data)
                return .success(getGroupUserData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
}
