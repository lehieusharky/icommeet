//
//  ContactTitleView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 19/10/2023.
//

import SwiftUI

struct ContactTitleView: View {
    private(set) var item: ContactTitleItem
    private(set) var onTapItem: (ContactTitleItem) -> Void
    
    init(item: ContactTitleItem, onTapItem: @escaping (ContactTitleItem) -> Void) {
        self.item = item
        self.onTapItem = onTapItem
    }
    
    var body: some View {
        HStack(spacing: Spacing.spacing16, content: {
            ZStack {
                AsyncImage(url: item.imageUrl) {
                    Image("ic_default_user")
                        .themeBackgroudColor(item.backgroundColor)
                }
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: Spacing.spacing4/2, content: {
                Text(item.name)
                    .adjustedSystemFont(ofSize: 18, weight: .bold)
                Text(item.userId)
                    .adjustedSystemFont(ofSize: 18, weight: .semibold)
            })
        })
        .onTapGesture {
            onTapItem(item)
        }
    }
}
