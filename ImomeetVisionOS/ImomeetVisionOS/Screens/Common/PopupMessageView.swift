//
//  ToastMessageView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 19/11/2023.
//

import SwiftUI

public class ButtonPopupModel {
    public let content: String
    public let backgroundColor: ThemeColorPicker
    
    init(content: String, backgroundColor: ThemeColorPicker) {
        self.content = content
        self.backgroundColor = backgroundColor
    }
}

struct PopupMessageView: View {
    
    private let icon: String
    private let title: String?
    private let message: String?
    private var leftButtonModel: ButtonPopupModel?
    private var rightButtonModel: ButtonPopupModel
    private var leftButtonAction: (() -> Void)?
    private var rightButtonAction: () -> Void
    
    private let popupSize: CGFloat = 250
    
    private init(_ icon: String,
                 title: String? = nil,
                 message: String? = nil,
                 leftButton: ButtonPopupModel?,
                 rightButton: ButtonPopupModel,
                 leftButtonAction: (() -> Void)?,
                 rightButtonAction: @escaping () -> Void) {
        self.icon = icon
        self.message = message
        self.title = title
        self.leftButtonModel = leftButton
        self.rightButtonModel = rightButton
        self.leftButtonAction = leftButtonAction
        self.rightButtonAction = rightButtonAction
    }
    
    @ViewBuilder var iconView: some View {
        Image(icon)
            .resizable()
            .renderingMode(.template)
            .clipShape(Circle())
            .frame(width: 40, height: 40)
    }
    
    @ViewBuilder var titleView: some View {
        Text(title ?? "")
            .adjustedSystemFont(ofSize: 20, weight: .bold)
    }
    
    @ViewBuilder var messageView: some View {
        Text(message ?? "")
            .adjustedSystemFont(ofSize: 15, weight: .regular)
            .lineLimit(nil)
    }
    
    @ViewBuilder var leftView: some View {
        CommonButton(backgroundColor: leftButtonModel?.backgroundColor ?? ThemeColorPicker(staticValue: Color.clear)) {
            rightButtonAction()
        } content: {
            Text(leftButtonModel?.content ?? "")
                .adjustedSystemFont(ofSize: 14, weight: .semibold)
                .themeTextColor(GlobalThemePicker.whiteColor)
        }
        .frame(height: 35)
    }
    
    @ViewBuilder var rightView: some View {
        CommonButton(backgroundColor: rightButtonModel.backgroundColor) {
            rightButtonAction()
        } content: {
            Text(rightButtonModel.content)
                .adjustedSystemFont(ofSize: 14, weight: .semibold)
                .themeTextColor(GlobalThemePicker.whiteColor)
        }
    }
    
    var body: some View {
        VStack(spacing: Spacing.spacing8, content: {
            Spacer()
            VStack(spacing: Spacing.spacing8, content: {
                iconView
                titleView
                messageView
                    .padding(.top, Spacing.spacing4)
                    .padding(.horizontal, Spacing.spacing20)
            })
            Spacer(minLength: Spacing.spacing8)
            HStack(spacing: Spacing.spacing8, content: {
                if leftButtonModel != nil {
                    leftView
                    rightView
                } else {
                    rightView
                }
            })
            .padding(.horizontal, Spacing.spacing12)
            Spacer()
        })
        .multilineTextAlignment(.center)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .filled(GlobalThemePicker.gray2Color))
        .frame(width: popupSize)
        .fixedSize(horizontal: false, vertical: true)
    }
}

extension PopupMessageView {
    static func initialize(_ icon: String,
                                  title: String? = nil,
                                  message: String? = nil,
                                  rightButton: ButtonPopupModel = ButtonPopupModel(content: "OK".localizedLanguage(), backgroundColor: GlobalThemePicker.gray1Color),
                                  rightAction: @escaping () -> Void) -> PopupMessageView {
        let popup = PopupMessageView(icon, title: title, message: message, leftButton: nil, rightButton: rightButton, leftButtonAction: nil, rightButtonAction: rightAction)
        return popup
    }
    
    static func initialize(_ icon: String,
                    title: String? = nil,
                    message: String? = nil,
                    leftButton: ButtonPopupModel = ButtonPopupModel(content: "Cancel".localizedLanguage(), backgroundColor: GlobalThemePicker.redColor),
                    rightButton: ButtonPopupModel = ButtonPopupModel(content: "OK".localizedLanguage(), backgroundColor: GlobalThemePicker.gray1Color),
                    leftAction: @escaping () -> Void,
                    rightAction: @escaping () -> Void) -> PopupMessageView {
        let popup = PopupMessageView(icon, title: title, message: message, leftButton: leftButton, rightButton: rightButton, leftButtonAction: leftAction, rightButtonAction: rightAction)
        return popup
    }
}

#Preview {
//    PopupMessageView.initialize("app_logo_ocn", title: "Hello", message: "Here we go sadlsakj kjsankdjh sa lksajdlkj lkjsal lnl ád sa") {
//        //
//    }
    
    PopupMessageView.initialize("app_logo_ocn", title: "Hello", message: "Here we go sadlsakj kjsankdjh sa lksajdlkj lkjsal lnl ád sa") {
        //
    } rightAction: {
        //
    }

}
