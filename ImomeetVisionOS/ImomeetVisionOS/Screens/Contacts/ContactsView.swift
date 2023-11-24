//
//  ContactsView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 14/10/2023.
//

import SwiftUI

struct ContactsView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    
    init() {
        self.viewModel = ContactsViewModel.initialize()
    }
    
    var body: some View {
        if let listModel = (viewModel as? ContactsViewModel)?.entity?.model as? ContactListModel,
                  let contacts = listModel.contacts {
            NavigationSplitView(sidebar: {
                List(contacts) { model in
                    ContactTitleView(item: ContactTitleItem(model: model)) { item in
                        print("item")
                    }
                }
                .navigationTitle(Text("Contacts".localizedLanguage()))
            }, detail: {
                //
            })
        } else {
            SFEmptyView()
        }
    }
}

#Preview {
    ContactsView()
}
