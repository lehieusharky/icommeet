//
//  ContentView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appRouter: AppRouter
    
    var body: some View {
        VStack {
            ImomeetState.AppView(route: appRouter.currentRoute)
        }
    }
}

//#Preview {
//    ContentView()
//}
