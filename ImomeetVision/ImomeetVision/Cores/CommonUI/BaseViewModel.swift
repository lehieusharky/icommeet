//
//  BaseViewModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 03/10/2023.
//

import Foundation
import Combine

protocol BaseViewModelDataProvider: NSObjectProtocol {
    func loadData<T>(_ handler: () async throws -> T?) async throws -> T?
    func refreshData()
}

public class BaseViewModel: NSObject, ObservableObject, Identifiable {
    @Published var themes: Themes = ThemeManager.sharedInstance.getCurrentTheme()
    
    @Published var isLoading: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    override init() {
        super.init()
        ThemeManager.sharedInstance.addThemeObserver(self)
    }
    
    deinit {
        ThemeManager.sharedInstance.removeThemeObserver(self)
    }
}

extension BaseViewModel: BaseViewModelDataProvider {
    func loadData<T>(_ handler: () async throws -> T?) async throws -> T? {
//        isLoading = true
        let value = try await handler()
//        isLoading = false
        return value
    }
    
    func refreshData() {}
}

extension BaseViewModel: Themable {
    func themDidChange() {
        themes = ThemeManager.sharedInstance.getCurrentTheme()
    }
}
