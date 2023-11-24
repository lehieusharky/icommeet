//
//  CheckGPSView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 19/10/2023.
//

import SwiftUI

struct CheckGPSView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("icon_menu_chat_action_live")
                    .multilineTextAlignment(.center)
                Text("Please go outside to find satellite!!!")
                    .multilineTextAlignment(.center)
                Text("id_disconnected".localizedLanguage())
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            .navigationTitle("Check GPS only")
        }
    }
}

#Preview {
    CheckGPSView()
}
