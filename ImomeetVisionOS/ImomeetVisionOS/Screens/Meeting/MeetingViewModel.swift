//
//  MeetingViewModel.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 07/11/2023.
//

import Foundation

class MeetingViewModel: BaseViewModel {
    @Dependency
    var meetingUseCase: MCUMeetingUseCase
    
    @Published var meetingListEntity: GetMeetingListEntity?
    
    override func loadData() async {
        await getMeetingList()
    }
}

extension MeetingViewModel {
    
    func getMeetingList() async {
        let vmeetID = SFCacheDefault.shared.getUsername()
        let accessToken = SFCacheDefault.shared.getAccessToken()
        let userSecret = NetworkUseCase.shared.getPasswordMD5()
        let recSize = 10
        let recentMeeting = "0"
        
        let apiVersion = NetworkUseCase.shared.getAPIIdentityVersion() ?? ""
        let isNeedPassword = NgnStringUtils.detectAPIVersion(forCheckPasswordMeeting: apiVersion)
        
        let params = GetMeetingListRequest(isNeedPassword: isNeedPassword,                                        vMeetId: vmeetID ?? "",
                                           userSecret: userSecret ?? "",
                                           recentMeeting: recentMeeting,
                                           toDate: "30",
                                           recSize: "\(recSize)",
                                           accessToken: accessToken ?? "")
        
        let meetingListInfo = await meetingUseCase.getMeetingList(params)
        DispatchQueue.main.async { [weak self] in
            self?.meetingListEntity = meetingListInfo
        }
    }
    
}
