//
//  DeveloperView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 19/10/2023.
//

import SwiftUI

struct DeveloperView: View {
    @State var a = true
    @State private var inputValue = 30
    @StateObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            Form{
                createSectionHeader("General".localizedLanguage()){
                    LabeledNumericInput(label: "SIP Unregistration timer", value: $inputValue)
                    createToggle(isOn: $a, label: "disable_adjust_camera_size_by_members".localizedLanguage())
                    createToggle(isOn: $a, label: "enable_adaptive_bitrate".localizedLanguage())
                    createToggle(isOn: $a, label: "enable_quality_scaler".localizedLanguage())
                    createToggle(isOn: $a, label: "id_tranfer_media_via_proxy".localizedLanguage())
                    createToggle(isOn: $a, label: "id_media_using_protocol".localizedLanguage())
                    createToggle(isOn: $a, label: "Apply Crop-Frame")
                    createToggle(isOn: $a, label: "id_diffsync".localizedLanguage())
                    createPicker(selection: $languageManager.language,
                                 label: "id_screen_share_local".localizedLanguage(),
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                }
                
                createSectionHeader("id_logging_engine".localizedLanguage()){
                    createPicker(selection: $languageManager.language,
                                 label: "id_send_log".localizedLanguage(),
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "id_mode_dev".localizedLanguage(),
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createPicker(selection: $languageManager.language,
                                 label: "id_native_log_level".localizedLanguage(),
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                }
                
                createSectionHeader("Media encoder"){
                    LabeledNumericInput(label: "Minimum QP", value: $inputValue)
                    LabeledNumericInput(label: "Maximum QP QP", value: $inputValue)
                    LabeledNumericInput(label: "CQ Quality Value", value: $inputValue)
                    LabeledNumericInput(label: "Min media bandwidth", value: $inputValue)
                    LabeledNumericInput(label: "Max media bandwidth", value: $inputValue)
                    LabeledNumericInput(label: "Bandwidth ratio", value: $inputValue)
                    LabeledNumericInput(label: "Video codec level", value: $inputValue)
                    createPicker(selection: $languageManager.language,
                                 label: "Bitrate mode",
                                 options: SFLanguage.allCases,
                                 valueKeyPath: \.self,
                                 displayValueClosure: { option in
                        option.localizedString()
                    })
                    createToggle(isOn: $a, label: "Enable setRate method")
                    createToggle(isOn: $a, label: "Enable GCM crypto suites")
                }
            }
            .navigationTitle("id_developer_option".localizedLanguage())
        }
    }
}

#Preview {
    DeveloperView()
}
