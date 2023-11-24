//
//  AccountManagerView.swift
//  ImomeetVisionOS
//
//  Created by Long Nguyen on 07/11/2023.
//

import SwiftUI

enum Action{
    case pick
    case take
    case remove
    case cancel
}

struct AccountManagerView: View {
    @State var isShowingActionSheet = false
    @State private var isPresentingFullScreen = false
    @State private var selectedOption: Action?
    @State var a = true
    @State var name = "Some Body"
    @State private var email = "veryveryverylongemailaddress@somemail.com"
    @State var phone = "0909090909"
    @StateObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            Form{
                Button(action: {
                    isShowingActionSheet = true
                }) {
                    HStack{
                        Text("Avatar".localizedLanguage())
                            .foregroundColor(.white)
                            .padding(Spacing.spacing8)
                        Spacer()
                        switch selectedOption {
                        case .pick:
                            Text("picking...")
                        case .take:
                            Text("taking...")
                        case .remove:
                            Text("removing...")
                        case .cancel:
                            Text("")
                        case nil:
                            Text("")
                        }
                        Button(action: {
                            isPresentingFullScreen = true
                        }) {
                            Image("icon_default_user")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50) // Adjust the size as needed
                        }
                        .buttonStyle(PlainButtonStyle())
                        .fullScreenCover(isPresented: $isPresentingFullScreen) {
                            FullScreenImageView(isPresented: $isPresentingFullScreen)
                        }
                    }
                }
                .actionSheet(isPresented: $isShowingActionSheet) {
                    ActionSheet(title: Text("Avatar".localizedLanguage()), buttons: [
                        .default(Text("id_choose_from_gallery".localizedLanguage()), action: {
                            selectedOption = .pick
                        }),
                        .default(Text("id_take_photo".localizedLanguage()), action: {
                            selectedOption = .take
                        }),
                        .destructive(Text("id_remove_avatar".localizedLanguage()), action: {
                            selectedOption = .remove
                        }),
                        .cancel(Text("Cancel".localizedLanguage()), action: {
                            selectedOption = .cancel
                        })
                    ])
                }
                
                InfoRow(title: "id_user_id", info: "09090909090")
                LabeledStringInput(label: "Name".localizedLanguage(), value: $name)
                LabeledStringInput(label: "Email".localizedLanguage(), value: $email, keyboardType: .emailAddress)
                LabeledStringInput(label: "id_phone_number".localizedLanguage(), value: $phone, keyboardType: .phonePad)
                NavigationLink {
                    UserRightsView()
                } label: {
                    Text("id_user_rights".localizedLanguage())
                        .padding(.leading, Spacing.spacing8)
                }
                NavigationLink {
                    SFEmptyView()
                } label: {
                    Text("id_pr_code".localizedLanguage())
                        .padding(.leading, Spacing.spacing8)
                }
                NavigationLink {
                    SFEmptyView()
                } label: {
                    Text("Wifi QR code")
                        .padding(.leading, Spacing.spacing8)
                }
            }
            .navigationTitle("id_account_manager".localizedLanguage())
        }
    }
}

struct FullScreenImageView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("icon_default_user")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Button(action: {
                    isPresented = false
                }) {
                    Text("Close".localizedLanguage())
                        .foregroundColor(.blue)
                        .padding()
                }
            }
        }
        .statusBar(hidden: true)
    }
}

#Preview {
    AccountManagerView()
}
