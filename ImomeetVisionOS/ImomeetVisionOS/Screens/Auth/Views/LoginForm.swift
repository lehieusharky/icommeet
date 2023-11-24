//
//  LoginForm.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 15/11/2023.
//

import SwiftUI

private struct LoginInfoView: View {
    @Binding var info: String
    private var imageName: String
    private var placeHolder: String
    private var changed: ((_ string: String) -> Void)?
    
    @State private var isShow: Bool = false
    
    init(info: Binding<String>, placeHolder: String, imageName: String, changed: ((_ string: String) -> Void)? = nil) {
        self._info = info
        self.placeHolder = placeHolder
        self.imageName = imageName
        self.changed = changed
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image(imageName)
                .renderingMode(.template)
                .themeForegroundColor(GlobalThemePicker.blackColor)
                .padding(.leading, 8)
            if placeHolder == "Password" {
                if !isShow {
                    SecureField(placeHolder, text: $info)
                        .placeholder(when: info.isEmpty, placeholder: {
                            Text(placeHolder).foregroundColor(.white)
                        })
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.leading, Spacing.spacing8)
                        .themeForegroundColor(GlobalThemePicker.blackColor)
                        .onChange(of: info, initial: true) { oldValue, newValue in
                            changed?(newValue)
                        }
                } else {
                    TextField(placeHolder, text: $info)
                        .placeholder(when: info.isEmpty, placeholder: {
                            Text(placeHolder).foregroundColor(.white)
                        })
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.leading, Spacing.spacing8)
                        .themeForegroundColor(GlobalThemePicker.blackColor)
                        .onChange(of: info, initial: true) { oldValue, newValue in
                            changed?(newValue)
                        }
                }
                
                Button(action: {
                    self.isShow.toggle()
                }) {
                    Image(systemName: isShow ? "eye.slash" : "eye")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .themeForegroundColor(GlobalThemePicker.blackColor)
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, Spacing.spacing8)
            } else {
                TextField(placeHolder, text: $info)
                    .placeholder(when: info.isEmpty, placeholder: {
                        Text(placeHolder)
                            .themeForegroundColor(GlobalThemePicker.whiteColor)
                    })
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.leading, Spacing.spacing8)
                    .themeForegroundColor(GlobalThemePicker.blackColor)
                    .onChange(of: info, initial: true) { oldValue, newValue in
                        changed?(newValue)
                    }
            }
            
        }
        .frame(height: 35)
        .background(Color.secondary.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct LoginForm: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isActive: Bool = false
    
    public var onTapLogin: (_ username: String, _ password: String) -> Void
    
    init(onTapLogin: @escaping (_ username: String, _ password: String) -> Void) {
        self.onTapLogin = onTapLogin
    }
    
    var body: some View {
        Group {
            VStack {
                LoginInfoView(info: $username,
                              placeHolder: "id_user_id".localizedLanguage() + "/" + "id_phone_number".localizedLanguage(),
                              imageName: "ic_user",
                              changed: { string in
                    isActive = !string.isEmpty && !password.isEmpty
                })
                
                LoginInfoView(info: $password,
                              placeHolder: "id_password".localizedLanguage(),
                              imageName: "ic_password",
                              changed: { string in
                    isActive = !string.isEmpty && !username.isEmpty
                })
                
                buttonSignIn
            }
        }
    }
    
    @ViewBuilder var buttonSignIn: some View {
        CommonButton(borderRadius: 25,
                     backgroundColor: isActive ? GlobalThemePicker.whiteColor : GlobalThemePicker.deactiveContentButton,
                     onClick: {
            onTapLogin(username, password)
        }, content: {
            Text("id_login".localizedLanguage().uppercased())
                .adjustedSystemFont(ofSize: 14, weight: .semibold)
                .themeTextColor(isActive ? GlobalThemePicker.blackColor : GlobalThemePicker.deactiveButtonColor)
        })
        .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32)
    }
}

#Preview {
    LoginForm(onTapLogin: { username, password in
        //
    })
}
