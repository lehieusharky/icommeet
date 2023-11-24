//
//  NetworkSettings.swift
//  ImomeetVisionOS
//
//  Created by Long Nguyen on 10/11/2023.
//

import SwiftUI

struct NetworkSettings: View {
    @Binding var path: NavigationPath
    
    @State var useHttps = true
    @State private var showPicker = false
    @State private var url = "www.sfvmeet.com"
    @State private var selectedOption = 2
    private let options = [
        "ind.sfvmeet.com",
        "www.fpxpert.cn",
        "www.sfvmeet.com"
    ]
    @State private var port = "80"
    @StateObject var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    HStack{
                        Image("iocn_ipserver")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding(.trailing, Spacing.spacing8)
                            .brightness(0.5)
                        StringInputField(value: $url, keyboardType: .URL, alignment: .left)
                        Button(action: {
                            showPicker.toggle()
                        }) {
                            if showPicker {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            } else {
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            }
                        }
                        
                        if showPicker {
                            Picker("", selection: $selectedOption) {
                                ForEach(options.indices, id: \.self) { index in
                                    Text(options[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedOption) {
                                updateURL()
                                showPicker = false
                            }
                        }
                        
                        
                    }
                    HStack{
                        Image("ic_port")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding(.trailing, Spacing.spacing8)
                            .colorInvert()
                            .brightness(0.5)
                    StringInputField(value: $port, keyboardType: .numberPad, alignment: .left)
                    }
                    HStack{
                        Image("icon-networking-secure")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding(.trailing, Spacing.spacing8)
                            .brightness(0.5)
                   createToggle(isOn: $useHttps, label: "Enable HTTPS".localizedLanguage())
                    
                    }
                    HStack{
                        Image("ic_tls")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding(.trailing, Spacing.spacing8)
                            .brightness(0.8)
                        createPicker(selection: $languageManager.language,
                                     label: "Enable SIP over TLS",
                                     options: SFLanguage.allCases,
                                     valueKeyPath: \.self,
                                     displayValueClosure: { option in
                            option.localizedString()
                        })
                    }
                }
                Section {
                    HStack{
                        Image("ic_proxy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .padding(.trailing, Spacing.spacing8)
                            .colorInvert()
                            .brightness(0.5)
                        createPicker(selection: $languageManager.language,
                                     label: "Proxy",
                                     options: SFLanguage.allCases,
                                     valueKeyPath: \.self,
                                     displayValueClosure: { option in
                            option.localizedString()
                        })
                    }
                }
            }
            .navigationTitle("Network settings")
        }
    }
    
    private func updateURL() {
        url = options[selectedOption]
    }
}

//#Preview {
//    NetworkSettings(path: <#Binding<NavigationPath>#>)
//}
