//
//  GeneralView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 18/10/2023.
//

import SwiftUI

struct GeneralView: View {
    
    @State var landscapeMode = false
    @State var autoAcceptCall = false
    @State var autoJoinMeeting = false
    @StateObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            Form{
                createToggle(isOn: $landscapeMode, label: "Run as landscape mode")
                createToggle(isOn: $autoAcceptCall, label: "id_accpetCall".localizedLanguage())
                createToggle(isOn: $autoJoinMeeting, label: "id_accpetJoinMeeting".localizedLanguage())
                createPicker(selection: $languageManager.language,
                             label: "id_language".localizedLanguage(),
                             options: SFLanguage.allCases,
                             valueKeyPath: \.self,
                             displayValueClosure: { option in
                    option.localizedString()
                })
                .navigationTitle("General".localizedLanguage())
            }
        }
    }
}
#Preview {
    GeneralView()
}
