//
//  AboutView.swift
//  ImomeetVisionOS
//
//  Created by Long Nguyen on 03/11/2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("xpert_logo")
                    .multilineTextAlignment(.center)
                Text("Version: X.X.X")
                    .multilineTextAlignment(.center)
                Text("2023-11-03 18:30")
                    .multilineTextAlignment(.center)
                Button(action: {}) {
                    Text("id_check_and_update".localizedLanguage().uppercased())
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 32)
                                .fill(Color.blue)
                        )
                        .padding(.horizontal)
                Spacer()
                Link("Privacy policy", destination: URL(string: "https://www.softfoundry.com/privacy-policy")!)
                            .foregroundColor(.blue)
                Text("2023 Softfoundry International Pte. Ltd")
                    .multilineTextAlignment(.center)
                    .padding()

            }
            .navigationTitle("About".localizedLanguage())
        }
    }
}

#Preview {
    AboutView()
}
