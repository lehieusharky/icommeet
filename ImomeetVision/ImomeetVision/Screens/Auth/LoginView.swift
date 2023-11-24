//
//  LoginView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import SwiftUI

struct LoginView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    
    @EnvironmentObject private var appRouter: AppRouter
    
    @State private var isSheetPresented = false
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var isActive: Bool = false
    @State var showAlert: Bool = false
    
    init() {
        self.viewModel = LoginViewModel()
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: Spacing.spacing16) {
                    Image("xpert_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 40)
                        .padding(.bottom, Spacing.spacing28)
                    
                    LoginInfoView(info: $username,
                                  placeHolder: "Username",
                                  imageName: "icon_user",
                                  changed: { string in
                        isActive = !string.isEmpty && !password.isEmpty
                    })
                    
                    LoginInfoView(info: $password,
                                  placeHolder: "Password",
                                  imageName: "icon_password",
                                  changed: { string in
                        isActive = !string.isEmpty && !username.isEmpty
                    })
                    
                    ButtonSignIn(active: isActive) {
                        Task {
                            viewModel.isLoading = true
                            guard let viewModel = viewModel as? LoginViewModel else {
                                return
                            }
                            let entity = await viewModel.loginWith(username, password: password)
                            
                            viewModel.isLoading = false
                            if entity {
                                appRouter.push(.main)
                            } else {
                                showAlert = true
                            }
                        }
                    }
                    
                    Text("id_other_options".localizedLanguage())
                        .adjustedSystemFont(ofSize: 14, weight: .medium)
                        .foregroundStyle(Color.white)
                        .padding(.top, Spacing.spacing16)
                    
                    HStack(spacing: Spacing.spacing12) {
                        OtherOptionsView(title: "id_scan_qrcode".localizedLanguage(), imageName: "icon_scan_qr") {
                            LogSF.LogTrace("tap icon")
                        }
                        OtherOptionsView(title: "id_connect_account".localizedLanguage(), imageName: "icon_social") {
                            LogSF.LogTrace("tap social")
                        }
                    }
                    
                    MoreSetting()
                }
                .padding(.top, 70)
                .padding(.bottom, 50)
                .padding(.horizontal, Spacing.spacing32)
            }
            .background(
                Image("bg_login")
                    .resizable()
                    .scaledToFill()
            )
            .alert(isPresented: $showAlert) {
                showAlert = false
                
                return Alert(title: Text("Login Failed"),
                             message: Text((viewModel as? LoginViewModel)?.loginErrorEntity?.error?.descriptionError ?? "" ),
                      dismissButton: .default(Text("OK")))
            }
            LoadingView(isLoading: viewModel.isLoading)
            
        }
    }
    
    struct LoginInfoView: View {
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
                    .padding(.leading, 8)
                if placeHolder == "Password" {
                    if !isShow {
                        SecureField(placeHolder, text: $info)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.leading, Spacing.spacing8)
                            .onChange(of: info, initial: true) { oldValue, newValue in
                                changed?(newValue)
                            }
                    } else {
                        TextField(placeHolder, text: $info)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.leading, Spacing.spacing8)
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
                            .foregroundColor(Color.gray)
                            .frame(width: 20, height: 20)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.trailing, Spacing.spacing8)
                } else {
                    TextField(placeHolder, text: $info)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.leading, Spacing.spacing8)
                        .onChange(of: info, initial: true) { oldValue, newValue in
                            changed?(newValue)
                        }
                }
                
            }
            .frame(height: 35)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }

    struct OtherOptionsView: View {
        private var title: String
        private var imageName: String
        private var onTap: () -> Void
        
        init(title: String, imageName: String, onTap: @escaping () -> Void) {
            self.title = title
            self.imageName = imageName
            self.onTap = onTap
        }
        
        var body: some View {
            ZStack {
                HStack(spacing: Spacing.spacing8)  {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding(.leading, Spacing.spacing12)
                    Text(title)
                        .adjustedSystemFont(ofSize: 13, weight: .regular)
                        .foregroundStyle(Color.blue)
                }
                .padding(.vertical, Spacing.spacing12)
                .background(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .onTapGesture {
                onTap()
            }
        }
    }
    
    struct MoreSetting: View {
        var body: some View {
            HStack(alignment: .center) {
                Spacer()
                
                VStack {
                    Button {
                        print("Touch Setting")
                    } label: {
                        Image("icon_settings")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(Color.clear)
                            .frame(width: 25, height: 25)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.all, 8)
                .background(Circle().fill(Color.white))
            }
            .padding(.all, Spacing.spacing8)
        }
    }
    
    struct ButtonSignIn: View {
        private var onTap: () -> Void
        private var isActive: Bool
        
        init(active: Bool, onTap: @escaping () -> Void) {
            self.onTap = onTap
            self.isActive = active
        }
        
        var body: some View {
            
            let textDeactiveColor = Color(red: 120/255, green: 120/255, blue: 120/255)
            let bgDeactiveColor = Color(red: 200/255, green: 200/255, blue: 200/255)
            
            Button {
                onTap()
            } label: {
                Text("id_login".localizedLanguage().uppercased())
                    .adjustedSystemFont(ofSize: 14, weight: .semibold)
                    .themeTextColor(isActive ? GlobalThemePicker.dominantColor : ThemeColorPicker(staticValue: textDeactiveColor))
                    .frame(maxWidth: .infinity, minHeight: 32)
                    .themeBackgroudColor(isActive ? GlobalThemePicker.whiteColor : ThemeColorPicker(staticValue: bgDeactiveColor))
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    LoginView()
        .frame(width: 400, height: 500)
}


