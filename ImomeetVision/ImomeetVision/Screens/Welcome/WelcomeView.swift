//
//  WelcomeView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 05/10/2023.
//

import SwiftUI
import AVKit

struct WelcomeView: BaseContentView {
    var viewModel: BaseViewModel
    
    @EnvironmentObject private var appRouter: AppRouter
    
    var value: Int
    
    init(value: Int) {
        self.value = value
        viewModel = WelcomeViewModel()
    }
    
    var body: some View {
        VStack{
            Button {
                (viewModel as? WelcomeViewModel)?.logout()
                appRouter.pop()
            } label: {
                Text("Logout".localizedLanguage())
            }

        }
    }
}

//#Preview {
//    WelcomeView()
//}
