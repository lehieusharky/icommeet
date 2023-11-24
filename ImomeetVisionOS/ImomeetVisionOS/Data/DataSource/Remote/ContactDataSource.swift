//
//  ContactDataSource.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 22/10/2023.
//

import Foundation

protocol ContactDataSource {
    func getContactList(_ request: ContactListRequest) async throws -> Result<ContactListModel, XpertError>
    func getContactInfo(_ request: ContactInfoRequest) async throws -> Result<ContactInfoModel?, XpertError>
    func removeContact(_ request: RemoveContactRequest) async throws -> Result<RemoveContactModel?, XpertError>
    func addContact(_ request: AddContactRequest) async throws -> Result<AddContactModel?, XpertError>
    func changeContactGroupName(_ request: ChangeContactGroupNameRequest) async throws -> Result<ChangeContactGroupNameModel?, XpertError>
    func removeContactGroup(_ request: RemoveContactGroupRequest) async throws -> Result<RemoveContactGroupModel?, XpertError>
}

class ContactDataSourceAPIImpl: ContactDataSource {
    private var apiPath: String {
        return (NetworkUseCase.shared.getWebServer() ?? "") + "/service/syncx.php"
    }
    
    private var extensionHeader: [String: String] {
        let dict: [String: String] = [
            "SF-ACCESS-TOKEN": SFCacheDefault.shared.getAccessToken() ?? "",
            "SF-USER-ID": SFCacheDefault.shared.getUsername() ?? "",
        ]
        
        return dict
    }
    
    private var userId: String = SFCacheDefault.shared.getUsername() ?? ""
    
    func getContactList(_ request: ContactListRequest) async throws -> Result<ContactListModel, XpertError> {
        guard let url = URL(string: apiPath) else {
            return .failure(XpertError(.error_100))
        }
        
        let params = request.toBodyString()
        
        do {
            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, headers: extensionHeader, parameters: params.data(using: .utf8)) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                guard let contactListData = try? decoder.decode(ContactListModel.self, from: data) else {
                    return .failure(XpertError(.error_100))
                }
                return .success(contactListData)
            case .failure(let failure):
                return .failure(XpertError(failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
    
    func getContactInfo(_ request: ContactInfoRequest) async throws -> Result<ContactInfoModel?, XpertError> {
        let contactInfoPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: contactInfoPath) else {
            return .failure(XpertError(.error_100))
        }

        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "uid_type": request.uidType,
            "accessToken" : request.accessToken,
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: mulDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let contactInfoData = try? decoder.decode(ContactInfoModel.self, from: data)
                return .success(contactInfoData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func removeContact(_ request: RemoveContactRequest) async throws -> Result<RemoveContactModel?, XpertError> {
        let removeContactPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: removeContactPath) else {
            return .failure(XpertError(.error_100))
        }

        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "uid_type": request.uidType,
            "contact": request.contact,
            "accessToken" : request.accessToken,
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: mulDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let removeContactData = try? decoder.decode(RemoveContactModel.self, from: data)
                return .success(removeContactData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }


    func addContact(_ request: AddContactRequest) async throws -> Result<AddContactModel?, XpertError> {
        let addContactPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: addContactPath) else {
            return .failure(XpertError(.error_100))
        }

        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "contact": request.contact,
            "contact_alias": request.contactAlias,
            "uid_type": request.uidType,
            "group": request.group,
            "group_id": request.groupId,
            "accessToken" : request.accessToken,
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: mulDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let addContactData = try? decoder.decode(AddContactModel.self, from: data)
                return .success(addContactData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }


    func changeContactGroupName(_ request: ChangeContactGroupNameRequest) async throws -> Result<ChangeContactGroupNameModel?, XpertError> {
        let changeContactGroupNamePath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: changeContactGroupNamePath) else {
            return .failure(XpertError(.error_100))
        }

        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "group": request.group,
            "new_group": request.newGroup,
            "accessToken" : request.accessToken,
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: mulDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let changeContactGroupNameData = try? decoder.decode(ChangeContactGroupNameModel.self, from: data)
                return .success(changeContactGroupNameData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func removeContactGroup(_ request: RemoveContactGroupRequest) async throws -> Result<RemoveContactGroupModel?, XpertError> {
        let removeContactGroupPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: removeContactGroupPath) else {
            return .failure(XpertError(.error_100))
        }

        let mulDict: [String: Any] = [
            "x": request.x,
            "user_id": request.userId,
            "group": request.group,
            "accessToken" : request.accessToken,
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: mulDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let removeContactGroupData = try? decoder.decode(RemoveContactGroupModel.self, from: data)
                return .success(removeContactGroupData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
    
}
