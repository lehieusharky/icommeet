//
//  CallPlayerView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import SwiftUI

struct CallPlayerView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    
    init() {
        self.viewModel = CallPlayerViewModel.initialize()
    }
    
    var body: some View {
        VStack {
            RoundedContentView(content: {
                //
            })
        }
    }
}

#Preview {
    CallPlayerView()
        .frame(width: 400, height: 400)
}
