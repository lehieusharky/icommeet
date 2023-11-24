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
    func getMCUMeetingID(_ getMCUMeetingIDEntity: GetMCUMeetingIDRequest) async -> GetMCUMeetingIDEntity
    func createMCUMeeting(_ mcuMeetingCreationDEntity: MCUMeetingCreationRequest) async -> MCUMeetingCreationEntity
    func editMCUMeeting(_ editMCUMeetingEntity: EditMCUMeetingRequest) async -> EditMCUMeetingEntity
    func extendOnGoingMCUMeetingTime(_ extendOnGoingMCUMeetingTimeEntity: ExtendOnGoingMCUMeetingTimeRequest) async -> ExtendOnGoingMCUMeetingTimeEntity
    func cancelMeeting(_ cancelMeetingEntity: CancelMeetingRequest) async -> CancelMeetingEntity
    func deleteMeeting(_ deleteMeetingEntity: DeleteMeetingRequest) async -> DeleteMeetingEntity
    func inviteUserDuringMeeting(_ inviteUserDuringMeetingEntity: InviteUserDuringMeetingRequest) async -> InviteUserDuringMeetingEntity
    func checkOnGoingMeetingState(_ checkOnGoingMeetingStateEntity: CheckOnGoingMeetingStateRequest) async throws -> CheckOnGoingMeetingStateEntity 

}
