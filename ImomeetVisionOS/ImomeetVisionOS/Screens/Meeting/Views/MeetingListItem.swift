//
//  MeetingListItem.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import Foundation
import SwiftUI

enum MeetingItemViewType {
    case meetingNow
    case meetingHistory
    case meetingList
}

class MeetingListItem: Identifiable {
    private(set) var model: GetMeetingInfoEntity?
    private(set) var meetingType: MeetingItemViewType
    private(set) var backgroundColor: ThemeColorPicker
    
    init(model: GetMeetingInfoEntity?,
         meetingType: MeetingItemViewType,
         backgroundColor: ThemeColorPicker = ThemeColorPicker(staticValue: Color.clear)) {
        self.model = model
        self.meetingType = meetingType
        self.backgroundColor = backgroundColor
    }
    
    public var title: String {
        switch meetingType {
        case .meetingNow:
            return "id_meeting_of".localizedLanguage()
        case .meetingHistory:
            return "id_history_record".localizedLanguage()
        case .meetingList:
            return model?.meetingName ?? ""
        }
    }
    
    public var imageIcon: String {
        switch meetingType {
        case .meetingNow:
            return "ic_settings"
        case .meetingHistory:
            return "ic_settings"
        case .meetingList:
            return "ic_meeting_state"
        }
    }
    
    public var buttonContent: String? {
        switch meetingType {
        case .meetingNow:
            return "Join".localizedLanguage()
        case .meetingHistory:
            return nil
        case .meetingList:
            return "Call".localizedLanguage()
        }
    }
}
