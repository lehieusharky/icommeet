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

    func getMCUMeetingID(_ getMCUMeetingIDEntity: GetMCUMeetingIDRequest) async -> GetMCUMeetingIDEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return GetMCUMeetingIDEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.getMCUMeetingID(getMCUMeetingIDEntity)
        
        switch results {
        case .success(let model):
            return GetMCUMeetingIDEntity(model)
        case .failure(let error):
            return GetMCUMeetingIDEntity(error)
        }
    }

    func createMCUMeeting(_ mcuMeetingCreationDEntity: MCUMeetingCreationRequest) async -> MCUMeetingCreationEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return MCUMeetingCreationEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.createMCUMeeting(mcuMeetingCreationDEntity)
        
        switch results {
        case .success(let model):
            return MCUMeetingCreationEntity(model)
        case .failure(let error):
            return MCUMeetingCreationEntity(error)
        }
    }

    func editMCUMeeting(_ editMCUMeetingEntity: EditMCUMeetingRequest) async -> EditMCUMeetingEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return EditMCUMeetingEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.editMCUMeeting(editMCUMeetingEntity)
        
        switch results {
        case .success(let model):
            return EditMCUMeetingEntity(model)
        case .failure(let error):
            return EditMCUMeetingEntity(error)
        }
    }

    func extendOnGoingMCUMeetingTime(_ extendOnGoingMCUMeetingTimeEntity: ExtendOnGoingMCUMeetingTimeRequest) async -> ExtendOnGoingMCUMeetingTimeEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return ExtendOnGoingMCUMeetingTimeEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.extendOnGoingMCUMeetingTime(extendOnGoingMCUMeetingTimeEntity)
        
        switch results {
        case .success(let model):
            return ExtendOnGoingMCUMeetingTimeEntity(model)
        case .failure(let error):
            return ExtendOnGoingMCUMeetingTimeEntity(error)
        }
    }

    func cancelMeeting(_ cancelMeetingEntity: CancelMeetingRequest) async -> CancelMeetingEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return CancelMeetingEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.cancelMeeting(cancelMeetingEntity)
        
        switch results {
        case .success(let model):
            return CancelMeetingEntity(model)
        case .failure(let error):
            return CancelMeetingEntity(error)
        }
    }

    func deleteMeeting(_ deleteMeetingEntity: DeleteMeetingRequest) async -> DeleteMeetingEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return DeleteMeetingEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.deleteMeeting(deleteMeetingEntity)
        
        switch results {
        case .success(let model):
            return DeleteMeetingEntity(model)
        case .failure(let error):
            return DeleteMeetingEntity(error)
        }
    }

    func inviteUserDuringMeeting(_ inviteUserDuringMeetingEntity: InviteUserDuringMeetingRequest) async -> InviteUserDuringMeetingEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return InviteUserDuringMeetingEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.inviteUserDuringMeeting(inviteUserDuringMeetingEntity)
        
        switch results {
        case .success(let model):
            return InviteUserDuringMeetingEntity(model)
        case .failure(let error):
            return InviteUserDuringMeetingEntity(error)
        }
    }

    func checkOnGoingMeetingState(_ checkOnGoingMeetingStateEntity: CheckOnGoingMeetingStateRequest) async -> CheckOnGoingMeetingStateEntity {
        guard let dataSource = dataSource as? MCUMeetingDataSourceAPIImpl else {
            return CheckOnGoingMeetingStateEntity(XpertError(.error_100))
        }
        
        let results = try await dataSource.checkOnGoingMeetingState(checkOnGoingMeetingStateEntity)
        
        switch results {
        case .success(let model):
            return CheckOnGoingMeetingStateEntity(model)
        case .failure(let error):
            return CheckOnGoingMeetingStateEntity(error)
        }
    }
}

