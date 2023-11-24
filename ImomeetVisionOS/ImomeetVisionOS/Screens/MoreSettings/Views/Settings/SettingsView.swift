//
//  SettingsView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 16/10/2023.
//

import SwiftUI
import AVKit

struct SettingsView: BaseContentView {
    @ObservedObject var viewModel: BaseViewModel
    @ObservedObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            ZStack{
                Form {
                    NavigationLink {
                        GeneralView()
                    } label: {
                        SettingsRow(info: "General", imageName: "icon_setting_group_general")
                    }
                    
                    NavigationLink {
                        MessNotiView()
                    } label: {
                        SettingsRow(info: "id_message_notification", imageName: "icon_setting_group_notification")
                    }
                    
                    NavigationLink {
                        ConferenceView()
                    } label: {
                        SettingsRow(info: "id_conference", imageName: "ic_conference")
                    }
                    
                    NavigationLink {
                        VideoAudioView()
                    } label: {
                        SettingsRow(info: "id_video_audio", imageName: "icon_setting_group_audio_video")
                    }
                    
                    NavigationLink {
                        PicturesRecordingsView()
                    } label: {
                        SettingsRow(info: "id_picture_recording", imageName: "picture_record_setting")
                    }
                    
                    NavigationLink {
                        DeveloperView()
                    } label: {
                        SettingsRow(info: "id_developer_option", imageName: "icon_setting_group_dev_option")
                    }

                    NavigationLink {
                        CheckGPSView()
                    } label: {
                        SettingsRow(info: "Check GPS only", imageName: "icon_chat_page_send_location")
                    }
                }
                .padding(8)
            }
            .navigationTitle("Settings".localizedLanguage())
        }
    }
    
    init() {
        viewModel = SettingsViewModel()
    }
    
}


#Preview {
    SettingsView()
}
