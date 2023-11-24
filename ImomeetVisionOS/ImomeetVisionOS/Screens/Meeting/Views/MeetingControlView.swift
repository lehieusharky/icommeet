//
//  MeetingControlView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 07/11/2023.
//

import SwiftUI

struct MeetingControlView: View {
    
    private var onClickCreateMeeting: () -> Void
    private var onClickScheduleMeeting: () -> Void
    
    init(onClickCreateMeeting: @escaping () -> Void, 
         onClickScheduleMeeting: @escaping () -> Void) {
        self.onClickCreateMeeting = onClickCreateMeeting
        self.onClickScheduleMeeting = onClickScheduleMeeting
    }
    
    var body: some View {
        HStack(spacing: Spacing.spacing16, content: {
            Spacer()
            createMeeting
            joinMeeting
            Spacer()
        })
    }
    
    @ViewBuilder var createMeeting: some View {
        CommonButton(title: "id_create_new_meeting".localizedLanguage(), 
                     borderRadius: 10,
                     backgroundColor: GlobalThemePicker.dominantColor) {
            onClickCreateMeeting()
        }
    }
    
    @ViewBuilder var joinMeeting: some View {
        CommonButton(title: "id_schedule_meeting".localizedLanguage(), 
                     borderRadius: 10,
                     backgroundColor: GlobalThemePicker.dominantColor) {
            onClickScheduleMeeting()
        }
    }
}

#Preview {
    MeetingControlView(onClickCreateMeeting: {
        //
    }, onClickScheduleMeeting: {
        //
    })
        .themeBackgroudColor(GlobalThemePicker.blackColor)
        .frame(width: 500, height: 40)
}
