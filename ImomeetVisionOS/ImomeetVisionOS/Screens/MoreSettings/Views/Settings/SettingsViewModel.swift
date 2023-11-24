//
//  SettingsViewModel.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 16/10/2023.
//

import Foundation
import SwiftUI

class SettingsViewModel: BaseViewModel {
//    var logoutUsecase: AuthUseCase
//    var logoutEntity: LogoutEntity?
    
    func logout() {
//        let request = LogoutRequestEntity(capcha: "", accessToken: "")
//        logoutUsecase.logout(request) { [weak self] results in
//            guard let self = self else {
//                return
//            }
//            
//            switch results {
//            case .success(let entity):
//                self.logoutEntity = entity
//                LogSF.LogTrace("Log out successed")
//            case .failure(let error):
//                LogSF.LogTrace("Log out not successed with error: \(String(describing: error.error?.descriptionError))")
//            }
//        }
    }
}


struct CheckboxRow: View {
    let option: String
    let isChecked: Bool
    let action: (Bool) -> Void
    
    var body: some View {
        Button(action: {
            action(!isChecked)
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .foregroundColor(isChecked ? .accentColor : .secondary)
                Text(option)
            }
            //            .padding(.leading)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Function to create a reusable DisclosureGroup
func createDisclosureGroup(
    isExpanded: Binding<Bool>,
    options: [String],
    selectedOptions: Binding<Set<String>>,
    label: String
) -> some View {
    DisclosureGroup(isExpanded: isExpanded) {
        VStack(alignment: .leading, spacing: Spacing.spacing8) {
            List(options, id: \.self) { option in
                CheckboxRow(option: option, isChecked: selectedOptions.wrappedValue.contains(option)) { isChecked in
                    if isChecked {
                        selectedOptions.wrappedValue.insert(option)
                    } else {
                        selectedOptions.wrappedValue.remove(option)
                    }
                }
            }
        }
    } label: {
        Text(label)
            .padding(.leading, Spacing.spacing8)
    }
}

