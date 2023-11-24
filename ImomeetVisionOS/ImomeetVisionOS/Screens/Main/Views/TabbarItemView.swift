//
//  TabbarItemView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 14/11/2023.
//

import SwiftUI

class TabbarItem {
    private(set) var image: String
    private(set) var selectedImage: String
    private(set) var title: String
    
    init(image: String, selectedImage: String? = nil, title: String) {
        self.image = image
        self.selectedImage = selectedImage ?? image
        self.title = title
    }
}

struct TabbarItemView: View {
    private let item: TabbarItem
    private var isSelected: Bool
    
    init(item: TabbarItem,
         selected: Bool) {
        self.item = item
        self.isSelected = selected
    }
    
    var body: some View {
        HStack(alignment: .center, content: {
            Label {
                Text(item.title)
            } icon: {
                Image(isSelected ? item.selectedImage : item.image)
                    .renderingMode(.template)
                    .foregroundColor(Color(.secondaryLabel))
            }
        })
    }
}

#Preview {
    TabbarItemView(item: TabbarItem(image: "ic_settings", title: "Meeting"), selected: false)
}
