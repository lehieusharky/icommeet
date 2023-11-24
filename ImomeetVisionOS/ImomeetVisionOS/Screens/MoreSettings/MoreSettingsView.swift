//
//  MoreSettingsView.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 15/10/2023.
//

import SwiftUI

struct MoreSettingsView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    @ObservedObject var languageManager = LanguageManager.shared
    @State private var showingPopup = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Form {
                    NavigationLink {
                        AccountManagerView()
                    } label: {
                        HStack(spacing: 0) {
                            Image("ic_default_user")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing, Spacing.spacing32)
                            VStack (alignment: .leading) {
                                Text("Some Body")
                                    .font(.title)
                                Text("01234567890")
                            }
                        }
                    }
                    .frame(height: 100)
                    
                    Section{
                        NavigationLink {
                            SFEmptyView()
                        } label: {
                            SettingsRow(info: "id_history_record", imageName: "icon_setting_group_audio_video")
                        }
                        
                        NavigationLink {
                            SettingsView()
                        } label: {
                            SettingsRow(info: "nav_settings", imageName: "ic_settings")
                        }
                        
                        NavigationLink {
                            ChangePasswordView()
                        } label: {
                            SettingsRow(info: "id_password", imageName: "ic_lock_blue")
                        }
                        
                        NavigationLink {
                            AboutView()
                        } label: {
                            SettingsRow(info: "About", imageName: "icon_information_new")
                        }
                    }
                    
                    Button(action: {
                        showingPopup.toggle()
                    }) {
                        SettingsRow(info: "Logout", imageName: "icon_presence_busy_02")
                            .foregroundColor(.white)
                    }
                    .alert("id_message_logout".localizedLanguage(), isPresented: $showingPopup) {
                        Button("Yes".localizedLanguage(), role: .destructive) {
                            // Action for Yes button
                            print("Log Out")
                        }
                        Button("Cancel".localizedLanguage(), role: .cancel, action: {})
                        
                    }
                }
                .padding(8)
            }
            .navigationTitle("More".localizedLanguage())
        }
    }
    
    init() {
        viewModel = SettingsViewModel()
    }
    
}

#Preview {
    MoreSettingsView()
}
