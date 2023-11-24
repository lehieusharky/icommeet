//
//  WelcomeViewModel.swift
//  ImomeetVision
//
//  Created by Thien Vu on 10/10/2023.
//

import Foundation

class WelcomeViewModel: BaseViewModel {
    var logoutUsecase: AuthUseCase
    var logoutEntity: LogoutEntity?
    
    override init() {
        self.logoutUsecase = SFUseCaseProvider.sharedInstance.loginUsecase()
        super.init()
    }
    
    func logout() {
        let request = LogoutRequestEntity(capcha: "", accessToken: "")
        logoutUsecase.logout(request) { [weak self] results in
            guard let self = self else {
                return
            }
            
            switch results {
            case .success(let entity):
                self.logoutEntity = entity
                LogSF.LogTrace("Log out successed")
            case .failure(let error):
                LogSF.LogTrace("Log out not successed with error: \(String(describing: error.error?.descriptionError))")
            }
        }
    }
}
