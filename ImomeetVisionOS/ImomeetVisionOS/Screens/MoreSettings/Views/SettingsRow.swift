//
//  SettingsRow.swift
//  ImomeetVision
//
//  Created by Long Nguyen on 18/10/2023.
//

import SwiftUI

//@ObservedObject var languageManager = LanguageManager.shared

struct SettingsRow: View {
    private var info: String
    private var imageName: String
    @ObservedObject var languageManager = LanguageManager.shared
    
    init(info: String, imageName: String) {
        self.info = info
        self.imageName = imageName
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(info.localizedLanguage())
//                .foregroundColor(Color.black)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.leading, Spacing.spacing8)
//            Spacer()
//            Image("ic_arrow_right2")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 20, height: 20)
        }
        .frame(height: 35)
//        .background(Color.white)
    }
}

struct SubmenuRow: View {
    private var info: String
    private var imageName: String
    private var selection: String
    @ObservedObject var languageManager = LanguageManager.shared
    
    init(info: String, imageName: String, selection: String = "") {
        self.info = info
        self.imageName = imageName
        self.selection = selection
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(info.localizedLanguage())
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.leading, Spacing.spacing8)
            Spacer()
            Text(selection.localizedLanguage())
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.leading, Spacing.spacing8)
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.trailing, Spacing.spacing8)
        }
        .frame(height: 35)

        .padding(-4)
    }
}

struct ToggleRow: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Text(text.localizedLanguage())
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.leading, Spacing.spacing8)
            Spacer()
        }
    }
}

struct InfoRow: View {
    private var title: String
    private var info: String
    @ObservedObject var languageManager = LanguageManager.shared
    
    init(title: String, info: String) {
        self.title = title
        self.info = info
    }
    
    var body: some View {
        HStack() {
            Text(title.localizedLanguage())
            Spacer()
            Text(info.localizedLanguage())
        }
        .padding(Spacing.spacing8)
    }
}

struct Title: View {
    private var title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
                HStack
                {
//                    Image("ic_arrow_left")
//                        .resizable(capInsets: EdgeInsets())
//                        .frame(width: 35.0, height: 35.0)
//                        .clipped()
//                        .padding(4)
                    Text(title.localizedLanguage())
                        .font(.title)
//                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color.white)
                        .padding(8)
                    Spacer()
                }
                .background(.blue)
//                .padding(.leading, Spacing.spacing8)
                .padding(.top, 0)
                .padding(.bottom, -2)
                
    }
}


struct HeadingRow: View {
    private var info: String
    @ObservedObject var languageManager = LanguageManager.shared
    
    init(info: String) {
        self.info = info
    }
    
    var body: some View {
        HStack {
            Text(info.localizedLanguage().uppercased())
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .padding(.leading, Spacing.spacing8)
            Spacer()
        }
        .frame(height: 35)
        .background(Color.white)
        .padding(-4)
    }
}

public func createToggle(isOn: Binding<Bool>, label: String) -> some View {
    return Toggle(isOn: isOn) {
        HStack(spacing: 0) {
            Text(label)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.leading, Spacing.spacing8)
            Spacer()
        }
    }
    .toggleStyle(.switch)
}

// Helper function to create a section header view
public func createSectionHeader<Content: View>(_ title: String, @ViewBuilder content: @escaping () -> Content) -> some View {
    return Section(header: Text(title)
        .font(.title2)
        .foregroundColor(Color.blue)
        .padding(8), content: content)
}

public func createPicker<Selection, Option>(selection: Binding<Selection>, label: String, options: [Option], valueKeyPath: KeyPath<Option, Selection>, displayValueClosure: @escaping (Option) -> String) -> some View where Option: Identifiable, Selection: Hashable {
    Picker(selection: selection, label: Text(label).padding(.leading, Spacing.spacing8)) {
        ForEach(options, id: \.id) { option in
            Text(displayValueClosure(option))
        }
    }
}

struct LabeledNumericInput: View {
    let label: String
    @Binding var value: Int
    
    var body: some View {
        HStack {
            Text(label)
                .padding(.leading, Spacing.spacing8)
            Spacer()
            NumericInputField(value: $value).frame(width: 100, alignment: .trailing)
        }
    }
}
struct LabeledStringInput: View {
    let label: String
    @Binding var value: String
    let keyboardType: UIKeyboardType
    
    init(label: String, value: Binding<String>, keyboardType: UIKeyboardType = .default) {
            self.label = label
            self._value = value
            self.keyboardType = keyboardType
        }
    
    var body: some View {
        HStack {
            Text(label)
                .padding(.leading, Spacing.spacing8)
            Spacer()
            StringInputField(value: $value, keyboardType: keyboardType)
                .frame(width: 150, alignment: .trailing)
        }
    }
}

struct NumericInputField: UIViewRepresentable {
    @Binding var value: Int
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textChanged(_:)), for: .editingChanged)
        textField.textAlignment = .right

        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = String(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    class Coordinator: NSObject {
        @Binding var value: Int
        
        init(value: Binding<Int>) {
            _value = value
        }
        
        @objc func textChanged(_ textField: UITextField) {
            if let text = textField.text, let intValue = Int(text) {
                value = intValue
            }
        }
    }
}

struct StringInputField: UIViewRepresentable {
    @Binding var value: String
    let keyboardType: UIKeyboardType
    let alignment: NSTextAlignment
    
    init(value: Binding<String>, keyboardType: UIKeyboardType = .default, alignment: NSTextAlignment = .right) {
            _value = value
            self.keyboardType = keyboardType
        self.alignment = alignment
        }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = keyboardType
        textField.borderStyle = .roundedRect
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textChanged(_:)), for: .editingChanged)
        textField.textAlignment = alignment

        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = value
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    class Coordinator: NSObject {
        @Binding var value: String
        
        init(value: Binding<String>) {
            _value = value
        }
        
        @objc func textChanged(_ textField: UITextField) {
            value = textField.text ?? ""
        }
    }
}

struct RightAlignedTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
        }
    }
}

extension View {
    func alignedRightAndWidth(_ width: CGFloat) -> some View {
        return self
            .frame(width: width)
            .modifier(RightAlignedTextModifier())
    }
}

#Preview {
    Group{
        Title("General")
        SettingsRow(info: "Sample", imageName: "chairman_star_blue")
        HeadingRow(info: "Heading")
        SubmenuRow(info: "Run as landscape mode", imageName: "icon_contact_checked_1608")
//        NavigatorItem("General")
    }
}
