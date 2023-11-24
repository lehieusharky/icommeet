//
//  WatermarkNormalPhotosView.swift
//  ImomeetVisionOS
//
//  Created by Long Nguyen on 08/11/2023.
//

import SwiftUI

struct WatermarkNormalPhotosView: View {
    @State private var selectedCenterOption = "None"
    @State private var useWatermark = false
    @State private var sentence = ""
    @State private var isShowingActionSheet = false
    @State private var iconOption: Action?
    @State private var rotation = 0
    @State private var textSize = 0
    @State private var textColor = Color.black
    @State private var backgroundColor = Color.white
    
    @State private var upperLeftExpanded = false
    @State private var upperRightExpanded = false
    @State private var lowerLeftExpanded = false
    @State private var lowerRightExpanded = false
    @State private var upperLeftOptions: Set<String> = []
    @State private var upperRightOptions: Set<String> = []
    @State private var lowerLeftOptions: Set<String> = []
    @State private var lowerRightOptions: Set<String> = []
    
    let allOptions = [
        "id_userid".localizedLanguage(),
        "id_device_model".localizedLanguage(),
        "id_date_time".localizedLanguage(),
        "text_location".localizedLanguage()
    ]
    
    var body: some View {
        NavigationStack{
            Form{
                createToggle(isOn: $useWatermark, label: "id_use_watermark".localizedLanguage())
                Picker(selection: $selectedCenterOption, label: Text("id_center".localizedLanguage()).padding(.leading, Spacing.spacing8))  {
                    Text("id_simple".localizedLanguage()).tag("Simple")
                    Text("id_tile".localizedLanguage()).tag("Tile")
                    Text("id_none".localizedLanguage()).tag("None")
                }
                
                if selectedCenterOption == "Tile" {
                    Picker(selection: $rotation, label: Text("id_rotation".localizedLanguage())) {
                        Text("0").tag(0)
                        Text("90").tag(1)
                        Text("180").tag(2)
                    }
                    .padding(.horizontal, Spacing.spacing24)
                }
                if selectedCenterOption == "Simple" || selectedCenterOption == "Tile" {
                    Group {
                        HStack {
                            Text("id_sentence".localizedLanguage())
                            Spacer()
                            StringInputField(value: $sentence)
                                .frame(width: 150, alignment: .trailing)
                        }
                        Button(action: {
                            isShowingActionSheet = true
                        }) {
                            HStack{
                                Text("Icon".localizedLanguage())
                                    .foregroundColor(.white)
                                Spacer()
                                Image("icon_default_user")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .actionSheet(isPresented: $isShowingActionSheet) {
                            ActionSheet(title: Text("Icon".localizedLanguage()), buttons: [
                                .default(Text("id_choose_from_gallery".localizedLanguage()), action: {
                                    iconOption = .pick
                                }),
                                .destructive(Text("id_remove".localizedLanguage()), action: {
                                    iconOption = .remove
                                }),
                                .cancel(Text("Cancel".localizedLanguage()), action: {
                                    iconOption = .cancel
                                })
                            ])
                        }
                        Picker(selection: $textSize, label: Text("id_text_size".localizedLanguage())) {
                            Text("id_small".localizedLanguage()).tag(0)
                            Text("id_medium".localizedLanguage()).tag(1)
                            Text("id_big".localizedLanguage()).tag(2)
                        }
                        
                        ColorPicker("id_text_color".localizedLanguage(), selection: $textColor)
                        
                        ColorPicker("id_text_background".localizedLanguage(), selection: $backgroundColor)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/, Spacing.spacing24)
                }
                
                createDisclosureGroup(
                    isExpanded: $upperLeftExpanded,
                    options: allOptions,
                    selectedOptions: $upperLeftOptions,
                    label: "id_upper_left".localizedLanguage()
                )
                
                createDisclosureGroup(
                    isExpanded: $upperRightExpanded,
                    options: allOptions,
                    selectedOptions: $upperRightOptions,
                    label: "id_upper_right".localizedLanguage()
                )
                
                createDisclosureGroup(
                    isExpanded: $lowerLeftExpanded,
                    options: allOptions,
                    selectedOptions: $lowerLeftOptions,
                    label: "id_lower_left".localizedLanguage()
                )
                
                createDisclosureGroup(
                    isExpanded: $lowerRightExpanded,
                    options: allOptions,
                    selectedOptions: $lowerRightOptions,
                    label: "id_lower_right".localizedLanguage()
                )
                
                Picker(selection: $textSize, label: Text("id_text_size".localizedLanguage()).padding(.leading, Spacing.spacing8)) {
                    Text("id_small".localizedLanguage()).tag(0)
                    Text("id_medium".localizedLanguage()).tag(1)
                    Text("id_big".localizedLanguage()).tag(2)
                }
                ColorPicker(selection: $textColor) {
                    Text("id_text_color".localizedLanguage())
                        .padding(.leading, Spacing.spacing8)
                }
                ColorPicker(selection: $backgroundColor){
                    Text("id_text_background".localizedLanguage())
                        .padding(.leading, Spacing.spacing8)
                }
            }
            .padding()
            .onAppear {
                selectedCenterOption = "None" // Set the initial selected option to "Simple" or "Tile" here
            }
            .navigationTitle("id_watermark_setting_message".localizedLanguage())
        }
    }
}

#Preview {
    WatermarkNormalPhotosView()
}
