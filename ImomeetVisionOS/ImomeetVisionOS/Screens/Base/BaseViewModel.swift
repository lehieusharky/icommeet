//
//  BaseViewModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 03/10/2023.
//

import Foundation
import Combine

protocol BaseViewModelDataProvider {
//    func loadData<T>(_ handler: () async throws -> T?) async throws -> T?
    func loadData() async
}

public class BaseViewModel: ObservableObject, Identifiable, BaseViewModelDataProvider {
    @Published var themes: Themes = ThemeManager.sharedInstance.getCurrentTheme()
    @Published var error: String?
    
    private var cancellables: Set<AnyCancellable> = []
    
    required init() {
        ThemeManager.sharedInstance.addThemeObserver(self)
        registerNotification()
    }
    
    deinit {
        ThemeManager.sharedInstance.removeThemeObserver(self)
    }
    
    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(onUserLogin), name: .userLoginSuccessNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onUserLogout), name: .userLogoutSuccessNotification, object: nil)
    }
    
    private func resolve() {
        let miror = Mirror(reflecting: self)
        let store = SFUseCaseProvider.sharedInstance.useCaseStore
        for children in miror.children {
            if let resolvable = children.value as? Resolvable {
                resolvable.resolve(withStore: store)
            }
        }
    }
    
    func loadData() async {}
}

extension BaseViewModel: Themable {
    func themDidChange() {
        themes = ThemeManager.sharedInstance.getCurrentTheme()
    }
}

extension BaseViewModel {
    @objc public func onUserLogin() {
        Task {
            LogSF.LogTrace("User is login")
            await loadData()
        }
    }
    
    @objc public func onUserLogout()  {
        LogSF.LogTrace("User is logout")
    }
}

extension BaseViewModel {
    static func initialize() -> Self {
        let viewModel = Self()
        viewModel.resolve()
        return viewModel
    }
}
