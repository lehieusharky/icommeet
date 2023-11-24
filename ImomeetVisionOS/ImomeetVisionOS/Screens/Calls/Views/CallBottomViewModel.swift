//
//  CallBottomViewModel.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 09/11/2023.
//

import Foundation

class CallBottomViewModel: BaseViewModel {
    @Dependency 
    private var callUseCase: CallUseCaseLocal
    
}

extension CallBottomViewModel: CallBottomActionProtocol {
    func onMute(_ state: Bool) {
        //do something
    }
    
    func onCamera(_ state: Bool) {
        //do something
    }
    
    func onExit() {
        //do something
    }
}
