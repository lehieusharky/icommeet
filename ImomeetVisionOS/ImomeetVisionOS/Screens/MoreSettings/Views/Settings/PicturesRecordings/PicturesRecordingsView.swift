//
//  PicturesRecordingsView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 19/10/2023.
//

import SwiftUI

struct PicturesRecordingsView: View {
    @StateObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            Form {
                createPicker(selection: $languageManager.language,
                             label: "Which camera to use when taking pictures or recording videos",
                             options: SFLanguage.allCases,
                             valueKeyPath: \.self,
                             displayValueClosure: { option in
                    option.localizedString()
                })
                NavigationLink {
                    WatermarkNormalPhotosView()
                } label: {
                    Text("id_watermark_setting_message".localizedLanguage())
                        .padding(.leading, Spacing.spacing8)
                }
                NavigationLink {
                    WatermarkHQPhotosView()
                } label: {
                    Text("id_watermark_setting_hdphoto".localizedLanguage())
                        .padding(.leading, Spacing.spacing8)
                }
                
            }
            .navigationTitle("id_picture_recording".localizedLanguage())
        }
    }
}

#Preview {
    PicturesRecordingsView()
}
