//
//  CallBottomView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import SwiftUI

fileprivate let controlList: [CallBottomMode] = [
    CallBottomMode(isOn: true, item: .camera),
    CallBottomMode(isOn: true, item: .microphone),
    CallBottomMode(item: .more),
    CallBottomMode(item: .exit)
]

struct CallBottomView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    @State var isChangedState: Bool = false
    
    private let modes: [CallBottomMode]
    private let isSelect: Bool = false
    private let meetingName: String
    private var callBottomAction: CallBottomActionProtocol?
    
    init(meetingName: String,
         modes: [CallBottomMode] = controlList) {
        self.meetingName = meetingName
        self.viewModel = CallBottomViewModel.initialize()
        self.modes = modes
        self.callBottomAction = viewModel as? CallBottomViewModel
    }
    
    var body: some View {
        VStack(spacing: Spacing.spacing16, content: {
            headerView
            actionView
        })
        .padding(Spacing.spacing16)
    }
    
    @ViewBuilder private var headerView: some View {
        HStack(spacing: Spacing.spacing8, content: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.gray)
            }
            
            Text(meetingName)
                .adjustedSystemFont(ofSize: 13, weight: .semibold)
            
            Spacer()
        })
    }
    
    @ViewBuilder private var actionView: some View {
        HStack(spacing: Spacing.spacing4, content: {
            ForEach(modes) { mode in
                AnyView(
                    CallBottomAction(mode) { mode in
                        switch mode.item {
                        case .microphone:
                            callBottomAction?.onMute(mode.isOn)
                        case .camera:
                            callBottomAction?.onCamera(mode.isOn)
                        case .more:
                            print("Will do later")
                        case .exit:
                            callBottomAction?.onExit()
                        }
                    }
                )
            }
        })
    }
}

struct CallBottomAction: View {
    @ObservedObject private var mode: CallBottomMode
    private(set) var isTouch: (_ mode: CallBottomMode) -> Void
    
    init(_ mode: CallBottomMode, touch: @escaping (_ mode: CallBottomMode) -> Void) {
        self.mode = mode
        self.isTouch = touch
    }
    
    var body: some View {
        CommonButton(borderRadius: 15.0, backgroundColor: mode.background) {
            mode.isOn.toggle()
        } content: {
            Image(systemName: mode.isOn ? mode.item.imageSelected : mode.item.imageUnSelected)
                .themeTintColor(mode.forceground)
                .frame(width: 50)
        }
        .frame(height: 30)
    }
}

#Preview {
    CallBottomView(meetingName: "Meeting 2023")
        .frame(width: 300, height: 100)
}
