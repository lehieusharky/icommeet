//
//  LoginView.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import SwiftUI

struct LoginView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    @ObservedObject var loginNavigator: LoginNavigator
    
    @State var showAlert: Bool = false
    @State var isLoading: Bool = false
    @Environment(\.dismissWindow) private var dismissWindow
    
    init() {
        self.viewModel = LoginViewModel.initialize()
        self.loginNavigator = LoginNavigator()
    }
    
    @ViewBuilder var buildLogo: some View {
        Image("xpert_logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 40)
            .padding(.bottom, Spacing.spacing28)
    }
    
    @ViewBuilder var buildLoginForm: some View {
        LoginForm { username, password in
            isLoading = true
            Task {
                await login(username: username, password: password)
            }
            isLoading = false
        }
    }
    
    @ViewBuilder var buildOptionView: some View {
        LoginOption {
            LogSF.LogTrace("tap icon")
        } onTapQRCode: {
            LogSF.LogTrace("tap social")
        }
    }
    
    @ViewBuilder var buildMoreSettings: some View {
        HStack(alignment: .center) {
            Spacer()
            
            Button(action: {
                loginNavigator.gotoNetworkSetting()
            }, label: {
                Image("ic_settings")
                    .resizable()
                    .renderingMode(.template)
                    .themeForegroundColor(GlobalThemePicker.blackColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            })
            .buttonStyle(PlainButtonStyle())
            .frame(width: 34, height: 34)
            .background(Circle().fill(Color.gray))
            .navigationDestination(for: String.self) { route in
                NetworkSettings(path: $loginNavigator.path)
            }
        }
        .padding(.all, Spacing.spacing8)
    }
    
    var body: some View {
        NavigationStack(path: $loginNavigator.path) {
            Form {
                VStack(spacing: Spacing.spacing16) {
                    buildLogo
                    buildLoginForm
                    buildMoreSettings
                }
                .padding(.top, 70)
            }
        }
        .alert(isPresented: $showAlert) {
            showAlert = false
            
            return Alert(title: Text("Login Failed"),
                         message: Text((viewModel as? LoginViewModel)?.loginEntity?.error?.descriptionError ?? "" ),
                         dismissButton: .default(Text("OK")))
        }
        LoadingView(isLoading: isLoading)
    }
}

//MARK: - Action
extension LoginView {
    func login(username: String, password: String) async {
        guard let viewModel = viewModel as? LoginViewModel else {
            return
        }
        let entity = await viewModel.loginWith(username, password: password)
        
        if entity {
            dismissWindow(id: Constants.loginView)
        } else {
            showAlert = true
        }
    }
}

#Preview {
    LoginView()
        .frame(width: 400, height: 450)
}


