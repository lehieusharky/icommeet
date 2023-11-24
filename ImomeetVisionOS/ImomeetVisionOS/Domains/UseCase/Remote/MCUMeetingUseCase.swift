//
//  MCUMeetingUseCase.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class MCUMeetingUseCase {
    private(set) var repository: MCUMeetingRepository
    
    init(repository: MCUMeetingRepository) {
        self.repository = repository
    }
    
    func getMeetingList(_ getMeetingListEntity: GetMeetingListRequest) async -> GetMeetingListEntity {
        let entity = await repository.getMeetingList(getMeetingListEntity)
        return entity
    }

    func getMeetingInfo(_ getMeetingInfoEntity: GetMeetingInfoRequest) async throws -> GetMeetingInfoEntity {
        let results = await repository.getMeetingInfo(getMeetingInfoEntity)
        return results
    }

    func getMCUMeetingID(_ getMCUMeetingIDEntity: GetMCUMeetingIDRequest) async throws -> GetMCUMeetingIDEntity {
        let results = try await repository.getMCUMeetingID(getMCUMeetingIDEntity)
        
        switch results {
        case .success(let success):
            return GetMCUMeetingIDEntity(success)
        case .failure(let failure):
            return GetMCUMeetingIDEntity(failure)
        }
    }

    func createMCUMeeting(_ mcuMeetingCreationEntity: MCUMeetingCreationRequest) async throws -> MCUMeetingCreationEntity {
        let results = try await repository.createMCUMeeting(mcuMeetingCreationEntity)
        
        switch results {
        case .success(let success):
            return MCUMeetingCreationEntity(success)
        case .failure(let failure):
            return MCUMeetingCreationEntity(failure)
        }
    }

    func editMCUMeeting(_ editMCUMeetingEntity: EditMCUMeetingRequest) async throws -> EditMCUMeetingEntity {
        let results = try await repository.editMCUMeeting(editMCUMeetingEntity)
        
        switch results {
        case .success(let success):
            return EditMCUMeetingEntity(success)
        case .failure(let failure):
            return EditMCUMeetingEntity(failure)
        }
    }

    func extendOnGoingMCUMeetingTime(_ extendOnGoingMCUMeetingTimeEntity: ExtendOnGoingMCUMeetingTimeRequest) async throws -> ExtendOnGoingMCUMeetingTimeEntity {
        let results = try await repository.extendOnGoingMCUMeetingTime(extendOnGoingMCUMeetingTimeEntity)
        
        switch results {
        case .success(let success):
            return ExtendOnGoingMCUMeetingTimeEntity(success)
        case .failure(let failure):
            return ExtendOnGoingMCUMeetingTimeEntity(failure)
        }
    }

    func cancelMeeting(_ cancelMeetingEntity: CancelMeetingRequest) async throws -> CancelMeetingEntity {
        let results = try await repository.cancelMeeting(cancelMeetingEntity)
        
        switch results {
        case .success(let success):
            return CancelMeetingEntity(success)
        case .failure(let failure):
            return CancelMeetingEntity(failure)
        }
    }

    func deleteMeeting(_ deleteMeetingEntity: DeleteMeetingRequest) async throws -> DeleteMeetingEntity {
        let results = try await repository.deleteMeeting(deleteMeetingEntity)
        
        switch results {
        case .success(let success):
            return DeleteMeetingEntity(success)
        case .failure(let failure):
            return DeleteMeetingEntity(failure)
        }
    }

    func inviteUserDuringMeeting(_ inviteUserDuringMeetingEntity: InviteUserDuringMeetingRequest) async throws -> InviteUserDuringMeetingEntity {
        let results = try await repository.inviteUserDuringMeeting(inviteUserDuringMeetingEntity)
        
        switch results {
        case .success(let success):
            return InviteUserDuringMeetingEntity(success)
        case .failure(let failure):
            return InviteUserDuringMeetingEntity(failure)
        }
    }

    func checkOnGoingMeetingState(_ checkOnGoingMeetingStateEntity: CheckOnGoingMeetingStateRequest) async throws -> CheckOnGoingMeetingStateEntity {
        let results = try await repository.checkOnGoingMeetingState(checkOnGoingMeetingStateEntity)
        
        switch results {
        case .success(let success):
            return CheckOnGoingMeetingStateEntity(success)
        case .failure(let failure):
            return CheckOnGoingMeetingStateEntity(failure)
        }
    }
}

