//
//  MeetingListItems.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import SwiftUI

struct MeetingListTitleView: View {
    private(set) var item: MeetingListItem
    private(set) var onCickJoin: (MeetingListItem) -> Void
    
    init(item: MeetingListItem, onTapItem: @escaping (MeetingListItem) -> Void) {
        self.item = item
        self.onCickJoin = onTapItem
    }
    
    var body: some View {
        HStack {
            HStack(spacing: Spacing.spacing16, content: {
                ZStack {
                    Image(item.imageIcon)
                        .themeBackgroudColor(item.backgroundColor)
                }
                .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: Spacing.spacing4/2, content: {
                    Text(item.title)
                        .adjustedSystemFont(ofSize: 18, weight: .bold)
                    Text(item.model?.participants ?? "")
                        .adjustedSystemFont(ofSize: 18, weight: .semibold)
                        .lineLimit(1)
                        .truncationMode(.tail)
                })
            })
            .padding(EdgeInsets(top: 0, leading: Spacing.spacing8, bottom: 0, trailing: 0))
            
            Spacer()
            
            CommonButton(title: item.buttonContent ?? "",
                         borderRadius: 25,
                         borderWidth: 1,
                         borderColor: GlobalThemePicker.dominantColor,
                         backgroundColor: ThemeColorPicker(staticValue: Color.clear)) {
                self.onCickJoin(item)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: Spacing.spacing8))
            .frame(width: 100, height: 50)
        }
    }
}

#Preview {
    MeetingListTitleView(item: MeetingListItem(model: GetMeetingInfoEntity(XpertError(.error_100)), meetingType: .meetingList)) { item in
        //
    }
}
