//
//  UserRightsView.swift
//  ImomeetVisionOS
//
//  Created by Long Nguyen on 07/11/2023.
//

import SwiftUI

struct UserRightsView: View {
    var body: some View {
        NavigationStack{
            Form{
                InfoRow(title: "nav_create_meeting", info: "id_allowed")
                InfoRow(title: "id_call_other_user", info: "id_allowed")
                InfoRow(title: "id_view_inspection_items", info: "id_unallowed")
                InfoRow(title: "id_maximum_video_resolution", info: "HD")
            }.navigationTitle("id_user_rights".localizedLanguage())
        }
    }
}

#Preview {
    UserRightsView()
}
