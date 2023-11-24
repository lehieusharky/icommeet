//
//  TabbarView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 14/11/2023.
//

import SwiftUI

struct TabbarView: View {
    private let tabViews: [AnyView]
    private let tabItems: [TabbarItem]
    
    @State private var selectedIndex = 0
    
    init( tabItems: [TabbarItem],
          tabViews: [any View]) {
        self.tabViews = tabViews.map({ AnyView($0)})
        self.tabItems = tabItems
    }
    
    var body: some View {
        TabView(selection: $selectedIndex,
                content: {
            ForEach(0..<tabViews.count, id: \.self) { index in
                tabViews[index]
                    .tabItem {
                        TabbarItemView(item: tabItems[index],
                                       selected: selectedIndex == index)
                    }
                    .onTapGesture {
                        handleSelectedTabbar(index)
                    }
            }
        })
        .accentColor(.orange)
    }
}

extension TabbarView {
    private func handleSelectedTabbar(_ index: Int) {
        if selectedIndex != index {
            selectedIndex = index
        }
    }
}

#Preview {
    TabbarView(tabItems: [
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
}
