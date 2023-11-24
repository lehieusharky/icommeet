//
//  MainTabbarView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct MainContentView: View {
    @Environment(\.openWindow) public var openWindow
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        openLoginView()
        
        return TabbarView(tabItems: [
            TabbarItem(image: "ic_meeting_un_selected",
                       selectedImage: "ic_meeting_selected",
                       title: "Meeting".localizedLanguage()),
            TabbarItem(image: "ic_chat_un_selected",
                       selectedImage: "ic_chat_selected",
                       title: "Messages".localizedLanguage()),
            TabbarItem(image: "ic_contacts_un_selected",
                       selectedImage: "ic_contacts_selected",
                       title: "Contacts".localizedLanguage()),
            TabbarItem(image: "ic_more_un_selected",
                       selectedImage: "ic_more_selected",
                       title: "More".localizedLanguage()),
        ], tabViews: [
            MeetingView(),
            ChatView(),
            ContactsView(),
            MoreSettingsView(),
        ])
        .ignoresSafeArea(.all)
    }
}

extension MainContentView {
    private func openLoginView() {
        openWindow(id: Constants.loginView)
    }
}

#Preview {
    MainContentView()
        .previewLayout(.sizeThatFits)
}
