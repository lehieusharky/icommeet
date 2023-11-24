//
//  MeetingView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 15/10/2023.
//

import SwiftUI

struct MeetingView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    
    init() {
        self.viewModel = MeetingViewModel.initialize()
    }
    
    var body: some View {
        NavigationStack {
            VStack( spacing: Spacing.spacing16, content: {
                Spacer()
                MeetingControlView {
                    //
                } onClickScheduleMeeting: {
                    //
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                
               
                Section(header: HStack {
                    Text("id_meeting_schedule".localizedLanguage())
                    Spacer()
                }
                    .padding(.leading, Spacing.spacing32)
                    .padding(.vertical, Spacing.spacing12)
                    .themeBackgroudColor(GlobalThemePicker.gray2Color)
                ) {
                    Text("sadasdsaasdsad")
                    Text("sadasdsaasdsad")
                }
                
                Section(header: HStack {
                    Text("id_meeting_group".localizedLanguage())
                    Spacer()
                }
                    .padding(.leading, Spacing.spacing32)
                    .padding(.vertical, Spacing.spacing12)
                    .themeBackgroudColor(GlobalThemePicker.gray2Color)
                ) {
                    ListVertical {
                        if let list = (viewModel as? MeetingViewModel)?.meetingListEntity?.meetingInfoList {
                            ForEach(list) { entity in
//                                MeetingListTitleView(item: MeetingListItem(model: entity)) { item in
//                                    //
//                                }
                            }
                        }
                    }
                }
                Spacer()
            })
        }
        .navigationTitle("Meeting".localizedLanguage())
    }
}

#Preview {
    MeetingView()
        .frame(width: 700, height: 500)
}
