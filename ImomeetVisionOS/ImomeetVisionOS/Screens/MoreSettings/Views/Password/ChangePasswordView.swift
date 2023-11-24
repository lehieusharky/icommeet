//
//  ChangePasswordView.swift
//  ImomeetVisionOS
//
//  Created by Long Nguyen on 03/11/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    @State var oldPassword = ""
    @State var newPassword = ""
    @State var newPasswordRetype = ""
    var body: some View {
        NavigationStack{
            Form{
                SecureField("id_old_passwork".localizedLanguage(), text: $oldPassword)
                SecureField("id_new_passwork".localizedLanguage(), text: $newPassword)
                SecureField("id_confirm_new_pass".localizedLanguage(), text: $newPasswordRetype)
            }
            .navigationTitle("nav_change_password".localizedLanguage())
        }
    }
}

#Preview {
    ChangePasswordView()
}
