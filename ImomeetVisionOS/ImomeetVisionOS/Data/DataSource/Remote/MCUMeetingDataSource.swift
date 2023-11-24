//
//  MCUMeetingDataSource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol MCUMeetingDataSource {
    func getMeetingList(_ request: GetMeetingListRequest) async throws -> Result<GetMeetingListModel?, XpertError>
    func getMeetingInfo(_ request: GetMeetingInfoRequest) async throws -> Result<GetMeetingInfoModel?, XpertError>
    func getMCUMeetingID(_ request: GetMCUMeetingIDRequest) async throws -> Result<GetMCUMeetingIDModel?, XpertError>
    func createMCUMeeting(_ request: MCUMeetingCreationRequest) async throws -> Result<MCUMeetingCreationModel?, XpertError>
    func editMCUMeeting(_ request: EditMCUMeetingRequest) async throws -> Result<EditMCUMeetingModel?, XpertError>
    func extendOnGoingMCUMeetingTime(_ request: ExtendOnGoingMCUMeetingTimeRequest) async throws -> Result<ExtendOnGoingMCUMeetingTimeModel?, XpertError>
    func cancelMeeting(_ request: CancelMeetingRequest) async throws -> Result<CancelMeetingModel?, XpertError>
    func deleteMeeting(_ request: DeleteMeetingRequest) async throws -> Result<DeleteMeetingModel?, XpertError>
    func inviteUserDuringMeeting(_ request: InviteUserDuringMeetingRequest) async throws -> Result<InviteUserDuringMeetingModel?, XpertError>
    func checkOnGoingMeetingState(_ request: CheckOnGoingMeetingStateRequest) async throws -> Result<CheckOnGoingMeetingStateModel?, XpertError>

}

class MCUMeetingDataSourceAPIImpl: MCUMeetingDataSource {
    private var apiPath: String {
        return (NetworkUseCase.shared.getWebServer() ?? "") + "/service/api.php"
    }
    
    private var extensionHeader: [String: String] {
        let dict: [String: String] = [
            "SF-ACCESS-TOKEN": SFCacheDefault.shared.getAccessToken() ?? "",
            "SF-USER-ID": SFCacheDefault.shared.getUsername() ?? "",
        ]
        
        return dict
    }
    
    func getMeetingList(_ request: GetMeetingListRequest) async -> Result<GetMeetingListModel?, XpertError> {
        guard let url = URL(string: apiPath) else {
            return .failure(XpertError(.error_100))
        }
        
        do {
            let data = request.toBody.data(using: .utf8)

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, headers: extensionHeader, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let getMeetingListData = try? decoder.decode(GetMeetingListModel.self, from: data)
                return .success(getMeetingListData)
            case .failure(let failure):
                return .failure(XpertError(failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func getMeetingInfo(_ request: GetMeetingInfoRequest) async -> Result<GetMeetingInfoModel?, XpertError> {
        let getMeetingInfoPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: getMeetingInfoPath) else {
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
                let getMeetingInfoData = try? decoder.decode(GetMeetingInfoModel.self, from: data)
                return .success(getMeetingInfoData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func getMCUMeetingID(_ request: GetMCUMeetingIDRequest) async throws -> Result<GetMCUMeetingIDModel?, XpertError> {
        let getMCUMeetingIDPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: getMCUMeetingIDPath) else {
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
                let getMCUMeetingIDData = try? decoder.decode(GetMCUMeetingIDModel.self, from: data)
                return .success(getMCUMeetingIDData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func createMCUMeeting(_ request: MCUMeetingCreationRequest) async throws -> Result<MCUMeetingCreationModel?, XpertError> {
        let mcuMeetingCreationPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: mcuMeetingCreationPath) else {
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
                let mcuMeetingCreationData = try? decoder.decode(MCUMeetingCreationModel.self, from: data)
                return .success(mcuMeetingCreationData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func editMCUMeeting(_ request: EditMCUMeetingRequest) async throws -> Result<EditMCUMeetingModel?, XpertError> {
        let editMCUMeetingPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: editMCUMeetingPath) else {
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
                let editMCUMeetingData = try? decoder.decode(EditMCUMeetingModel.self, from: data)
                return .success(editMCUMeetingData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func extendOnGoingMCUMeetingTime(_ request: ExtendOnGoingMCUMeetingTimeRequest) async throws -> Result<ExtendOnGoingMCUMeetingTimeModel?, XpertError> {
        let extendOnGoingMCUMeetingTimePath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: extendOnGoingMCUMeetingTimePath) else {
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
                let extendOnGoingMCUMeetingTimeData = try? decoder.decode(ExtendOnGoingMCUMeetingTimeModel.self, from: data)
                return .success(extendOnGoingMCUMeetingTimeData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func cancelMeeting(_ request: CancelMeetingRequest) async throws -> Result<CancelMeetingModel?, XpertError> {
        let cancelMeetingPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: cancelMeetingPath) else {
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
                let cancelMeetingData = try? decoder.decode(CancelMeetingModel.self, from: data)
                return .success(cancelMeetingData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func deleteMeeting(_ request: DeleteMeetingRequest) async throws -> Result<DeleteMeetingModel?, XpertError> {
        let deleteMeetingPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: deleteMeetingPath) else {
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
                let deleteMeetingData = try? decoder.decode(DeleteMeetingModel.self, from: data)
                return .success(deleteMeetingData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func inviteUserDuringMeeting(_ request: InviteUserDuringMeetingRequest) async throws -> Result<InviteUserDuringMeetingModel?, XpertError> {
        let inviteUserDuringMeetingPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: inviteUserDuringMeetingPath) else {
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
                let inviteUserDuringMeetingData = try? decoder.decode(InviteUserDuringMeetingModel.self, from: data)
                return .success(inviteUserDuringMeetingData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }

    func checkOnGoingMeetingState(_ request: CheckOnGoingMeetingStateRequest) async throws -> Result<CheckOnGoingMeetingStateModel?, XpertError> {
        let checkOnGoingMeetingStatePath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: checkOnGoingMeetingStatePath) else {
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
                let checkOnGoingMeetingStateData = try? decoder.decode(CheckOnGoingMeetingStateModel.self, from: data)
                return .success(checkOnGoingMeetingStateData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
}
