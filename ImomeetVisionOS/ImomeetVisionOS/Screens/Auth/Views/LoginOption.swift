//
//  LoginOption.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 15/11/2023.
//

import SwiftUI

struct LoginOption: View {
    private let onTapSocial: () -> Void
    private let onTapQRCode: () -> Void
    
    init(onTapSocial: @escaping () -> Void, onTapQRCode: @escaping () -> Void) {
        self.onTapSocial = onTapSocial
        self.onTapQRCode = onTapQRCode
    }
    
    var body: some View {
        HStack(spacing: Spacing.spacing12) {
            buildOption(title: "id_scan_qrcode".localizedLanguage(), imageName: "ic_scan_qr") {
                onTapQRCode()
            }
            buildOption(title: "id_connect_account".localizedLanguage(), imageName: "ic_social") {
                onTapSocial()
            }
        }
    }
    
    private func buildOption(title: String, imageName: String, onTap: @escaping () -> Void) -> some View {
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

#Preview {
    LoginOption {
        //
    } onTapQRCode: {
        //
    }
}
