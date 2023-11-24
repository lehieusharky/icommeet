//
//  ConferenceView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 19/10/2023.
//

import SwiftUI

struct ConferenceView: View {
    
    @State var cameraOnEntry = true
    @State var microOnEntry = true
    @State var displayVideoResolution = true
    @State var confirmHQPhoto = false
    @State var confirmChairmanRequest = false
    @State var autoOpenExternalCam = false
    @State var supportLLVision = false
    
    @State var hideSmallVideo = false
    @State var showLocalVideoBig = false
    
    @State var hideNonVideoPpl = false
    @State var saveMeetingDisplayMode = true
    
    @ObservedObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            Form {
                createSectionHeader("General".localizedLanguage()){
                    createToggle(isOn: $cameraOnEntry, label: "id_turn_on_camera".localizedLanguage())
                    createToggle(isOn: $microOnEntry, label: "id_turn_on_micro".localizedLanguage())
                    createToggle(isOn: $displayVideoResolution, label: "id_display_video_resolution".localizedLanguage())
                    createToggle(isOn: $confirmHQPhoto, label: "id_confirm_capture_HQ_photo".localizedLanguage())
                    createToggle(isOn: $confirmChairmanRequest, label: "id_confirm_mic_camera".localizedLanguage())
                    createToggle(isOn: $autoOpenExternalCam, label: "Open external camera automatically")
                    createToggle(isOn: $supportLLVision, label: "Support LLVision glass")
                    
                    NavigationLink {
                        SFEmptyView()
                    } label: {
                        Text("id_external_camera".localizedLanguage())
                            .padding(.leading, Spacing.spacing8)
                    }
                }
                
                createSectionHeader("Peer-to-peer conference") {
                    
                    createToggle(isOn: $hideSmallVideo, label: "Hide small video")
                    createToggle(isOn: $showLocalVideoBig, label: "Show local video at big view")
                    
                }
                
                createSectionHeader("id_multi_conference".localizedLanguage()){
                    createToggle(isOn: $hideNonVideoPpl, label: "hide_non_video_participant".localizedLanguage())
                    createToggle(isOn: $saveMeetingDisplayMode, label: "save_meeting_display_mode".localizedLanguage())
                }
            }
            .navigationTitle("id_conference".localizedLanguage())
            .padding(8)
        }
    }
}

#Preview {
    ConferenceView()
}
