//
//  MessNotiView.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 19/10/2023.
//

import SwiftUI

struct MessNotiView: View {
    
    @State var enterToSend = true
    @State var playTone = true
    @State var vibrateDevice = true
    @State var hideNotiContent = false
    
    var body: some View {
        NavigationStack{
            Form{
                createSectionHeader("Messages".localizedLanguage()){
                    createToggle(isOn: $enterToSend, label: "id_click_send_message".localizedLanguage())
                }
                
                createSectionHeader("id_notification".localizedLanguage()){
                    createToggle(isOn: $playTone, label: "id_play_tone".localizedLanguage())
                    createToggle(isOn: $vibrateDevice, label: "id_vibrat_device".localizedLanguage())
                    createToggle(isOn: $hideNotiContent, label: "id_hide_notification_conten".localizedLanguage())
                }
            }
            .navigationTitle("id_message_notification".localizedLanguage())
        }
    }
}

#Preview {
    MessNotiView()
}
