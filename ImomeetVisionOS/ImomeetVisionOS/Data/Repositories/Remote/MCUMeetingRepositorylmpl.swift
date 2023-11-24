//
//  MCUMeetingRepositoryImpl.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

class MCUMeetingRepositoryImpl: MCUMeetingRepository {
    
    private(set) var dataSource: MCUMeetingDataSource?
    
    init(dataSource: MCUMeetingDataSource? = nil) {
        self.dataSource = dataSource
    }
    
    func getMeetingList(_ getMeetingListEntity: GetMeetingListRequest) async -> GetMeetingListEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return GetMeetingListEntity(XpertError(.error_100))
        }
        
        let results = await dataSource.getMeetingList(getMeetingListEntity)
        
        
        switch results {
        case .success(let model):
            if let errorX = model?.errorX {
                return GetMeetingListEntity(errorX)
            }
            return GetMeetingListEntity(model)
        case .failure(let error):
            return GetMeetingListEntity(error)
        }
    }
    
    func getMeetingInfo(_ getMeetingInfoEntity: GetMeetingInfoRequest) async -> GetMeetingInfoEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return GetMeetingInfoEntity(XpertError(.error_100))
        }
        
        let results = await dataSource.getMeetingInfo(getMeetingInfoEntity)
        
        switch results {
        case .success(let model):
            if let errorX = model?.errorX {
                return GetMeetingInfoEntity(errorX)
            }
            return GetMeetingInfoEntity(model?.meetings)
        case .failure(let error):
            return GetMeetingInfoEntity(error)
        }
    }

    func getMCUMeetingID(_ getMCUMeetingIDEntity: GetMCUMeetingIDRequest) async throws -> Result<GetMCUMeetingIDModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.getMCUMeetingID(getMCUMeetingIDEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }

    func createMCUMeeting(_ mcuMeetingCreationDEntity: MCUMeetingCreationRequest) async throws -> Result<MCUMeetingCreationModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.createMCUMeeting(mcuMeetingCreationDEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }

    func editMCUMeeting(_ editMCUMeetingEntity: EditMCUMeetingRequest) async throws -> Result<EditMCUMeetingModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.editMCUMeeting(editMCUMeetingEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }

    func extendOnGoingMCUMeetingTime(_ extendOnGoingMCUMeetingTimeEntity: ExtendOnGoingMCUMeetingTimeRequest) async throws -> Result<ExtendOnGoingMCUMeetingTimeModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.extendOnGoingMCUMeetingTime(extendOnGoingMCUMeetingTimeEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }

    func cancelMeeting(_ cancelMeetingEntity: CancelMeetingRequest) async throws -> Result<CancelMeetingModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.cancelMeeting(cancelMeetingEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }

    func deleteMeeting(_ deleteMeetingEntity: DeleteMeetingRequest) async throws -> Result<DeleteMeetingModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.deleteMeeting(deleteMeetingEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }

    func inviteUserDuringMeeting(_ inviteUserDuringMeetingEntity: InviteUserDuringMeetingRequest) async throws -> Result<InviteUserDuringMeetingModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.inviteUserDuringMeeting(inviteUserDuringMeetingEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }

    func checkOnGoingMeetingState(_ checkOnGoingMeetingStateEntity: CheckOnGoingMeetingStateRequest) async throws -> Result<CheckOnGoingMeetingStateModel?, XpertError> {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return .failure(XpertError(.error_100))
        }
        
        let results = try await dataSource.checkOnGoingMeetingState(checkOnGoingMeetingStateEntity)
        
        switch results {
        case .success(let model):
            guard let model = model else {
                return .success(nil)
            }
            return .success(model)
        case .failure(let error):
            return .failure(error)
        }
    }
}

