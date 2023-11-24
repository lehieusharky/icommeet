//
//  VideoAudioView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 19/10/2023.
//

import SwiftUI
enum VideoCodec {
    case SFDVPro
    case H264
    case H265
}
struct VideoAudioView: View {
    @State var videoCodec = VideoCodec.H265  
    @State var enableLowBitrateAudio = true
    @StateObject var languageManager = LanguageManager.shared

    var body: some View {
        NavigationStack{
            Form{
                createSectionHeader("id_video_quality".localizedLanguage()){
                    createPicker(selection: $languageManager.language,
                                 label: "id_video_codec".localizedLanguage(),
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "id_video_size".localizedLanguage() + " (P2P)",
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "id_video_size".localizedLanguage() + " (MCU)",
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                }
                
                createSectionHeader("id_audio_quality".localizedLanguage()){
                    createToggle(isOn: $enableLowBitrateAudio, label: "Enable low bitrate audio")
                }

                createSectionHeader("Camera".localizedLanguage()){
                    createPicker(selection: $languageManager.language,
                                 label: "id_camera_frame_rate".localizedLanguage(),
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "Orientation of front camera",
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "Orientation of back camera",
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "Mirror of front camera",
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "Mirror of back camera",
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                }
                
                createSectionHeader("id_screen_share_local".localizedLanguage()){
                    createPicker(selection: $languageManager.language,
                                 label: "id_mode_dev".localizedLanguage(),
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                }
            }
            .navigationTitle("id_video_audio".localizedLanguage())
//            .padding(8)
        }
    }
}

#Preview {
    VideoAudioView()
}
