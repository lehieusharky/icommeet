//
//  MCUMeetingRepository.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol MCUMeetingRepository {
    func getMeetingList(_ getMeetingListEntity: GetMeetingListRequest) async -> GetMeetingListEntity
    func getMeetingInfo(_ getMeetingInfoEntity: GetMeetingInfoRequest) async -> GetMeetingInfoEntity
    func getMCUMeetingID(_ getMCUMeetingIDEntity: GetMCUMeetingIDRequest) async throws -> Result<GetMCUMeetingIDModel?, XpertError>
    func createMCUMeeting(_ mcuMeetingCreationDEntity: MCUMeetingCreationRequest) async throws -> Result<MCUMeetingCreationModel?, XpertError>
    func editMCUMeeting(_ editMCUMeetingEntity: EditMCUMeetingRequest) async throws -> Result<EditMCUMeetingModel?, XpertError>
    func extendOnGoingMCUMeetingTime(_ extendOnGoingMCUMeetingTimeEntity: ExtendOnGoingMCUMeetingTimeRequest) async throws -> Result<ExtendOnGoingMCUMeetingTimeModel?, XpertError>
    func cancelMeeting(_ cancelMeetingEntity: CancelMeetingRequest) async throws -> Result<CancelMeetingModel?, XpertError>
    func deleteMeeting(_ deleteMeetingEntity: DeleteMeetingRequest) async throws -> Result<DeleteMeetingModel?, XpertError>
    func inviteUserDuringMeeting(_ inviteUserDuringMeetingEntity: InviteUserDuringMeetingRequest) async throws -> Result<InviteUserDuringMeetingModel?, XpertError>
    func checkOnGoingMeetingState(_ checkOnGoingMeetingStateEntity: CheckOnGoingMeetingStateRequest) async throws -> Result<CheckOnGoingMeetingStateModel?, XpertError>

}
