//
//  FloatingTextField.swift
//  Hotel
//
//  Created by macbook on 20.12.2023.
//

import SwiftUI
import AnyFormatKit
import AnyFormatKitSwiftUI

struct FloatingTextField: View {
    // MARK: - Attributes
    
    @Binding var title: String
    @Binding var text: String
    @Binding var isValid: Bool
    
    private let type: TextFieldType 
    @FocusState private var focusedField: Field?
    @State private var isTap: Bool = false
    
    private let font = FontFamily.SFProDisplay.regular
    private let titleColor = Asset.Colors.a9abb7.swiftUIColor
    private let radius: CGFloat = 10
    private let rectangleColor = Asset.Colors.f6f6f9424242.swiftUIColor
    private let alertColor = Asset.Colors.eb5757.swiftUIColor
    private let textColor = Asset.Colors._000000Ffffff.swiftUIColor

    var body: some View {
        getTextField(type: type)
            .background(
                Rectangle()
                    .foregroundColor(isValid ? rectangleColor : alertColor)
                    .cornerRadius(radius)
                    .padding(EdgeInsets(top: -16,
                                        leading:  -16,
                                        bottom: -16,
                                        trailing: -16
                                       ))
            )
            .animation(.default, value: isValid)
            .animation(.easeOut(duration: 0.1), value: text.isEmpty)
            .animation(.easeOut(duration: 0.1), value: isTap)
    }
    
    
    // MARK: - Init
    
    init(title: Binding<String>, text: Binding<String>, isValid: Binding<Bool> ,type: TextFieldType = .text) {
        self._title = title
        self._text = text
        self._isValid = isValid
        self.type = type
    }
    
    // MARK: - Methods
    
    @ViewBuilder
    private func getTextField(type: TextFieldType) -> some View {
        switch type {
        case .text:
            ZStack(alignment: .leading) {
                Text(title)
                    .font(.custom(font, size: 17))
                    .foregroundColor(titleColor)
                    .offset(y: text.isEmpty ? 0 : -27)
                    .scaleEffect(text.isEmpty ? 1 : 0.6, anchor: .leading)

                TextField("", text: $text)
                    .focused($focusedField, equals: .text)
                    .submitLabel(.next)
                    .onChange(of: text, perform: { newValue in
                        if !self.isValid {
                            isValid = true
                        }
                    })
            }
        case .date:
            ZStack(alignment: .leading) {
                Text(title)
                    .font(.custom(font, size: 17))
                    .foregroundColor(titleColor)
                    .offset(y: text.isEmpty ? 0 : -27)
                    .scaleEffect(text.isEmpty ? 1 : 0.6, anchor: .leading)

                FormatTextField(unformattedText: $text,
                                textPattern: "##.##.####")
                .keyboardType(.numberPad)
                .submitLabel(.next)
                .focused($focusedField, equals: .text)
                .onChange(of: text, perform: { _ in
                    if !self.isValid {
                        isValid = true
                    }
                })
            }
        case .phoneNumber:
            ZStack(alignment: .leading) {
                Text(title)
                    .font(.custom(font, size: 17))
                    .foregroundColor(titleColor)
                    .offset(y: !isTap ? 0 : -27)
                    .scaleEffect(!isTap ? 1 : 0.6, anchor: .leading)

                FormatStartTextField(unformattedText: $text,
                                     placeholder: "+7",
                                     formatter: PlaceholderTextInputFormatter(textPattern: "+7 (***) *** ** **", patternSymbol: "*"))
                .keyboardType(.numberPad)
                .foregroundColor(isTap ? textColor : Color.clear)
                .focused($focusedField, equals: .text)
                .onTapGesture(perform: {
                    self.isTap = true
                    
                    if !self.isValid {
                        isValid = true
                    }
                })
            }
        case .email:
            ZStack(alignment: .leading) {
                Text(title)
                    .font(.custom(font, size: 17))
                    .foregroundColor(titleColor)
                    .offset(y: text.isEmpty ? 0 : -27)
                    .scaleEffect(text.isEmpty ? 1 : 0.6, anchor: .leading)

                TextField("", text: $text)
                    .focused($focusedField, equals: .text)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .onChange(of: text, perform: { _ in
                        if !self.isValid {
                            isValid = true
                        }
                    })
            }
        case .passportNumber:
            ZStack(alignment: .leading) {
                Text(title)
                    .font(.custom(font, size: 17))
                    .foregroundColor(titleColor)
                    .offset(y: text.isEmpty ? 0 : -27)
                    .scaleEffect(text.isEmpty ? 1 : 0.6, anchor: .leading)

                FormatTextField(unformattedText: $text,
                                textPattern: "## #######")
                .keyboardType(.numberPad)
                .submitLabel(.next)
                .onChange(of: text, perform: { _ in
                    if !self.isValid {
                        isValid = true
                    }
                })
                .focused($focusedField, equals: .text)
            }
        }
    }
    
}

// MARK: - Field

extension FloatingTextField {
    enum Field {
        case text
    }
}

// MARK: - Type

extension FloatingTextField {
    enum TextFieldType {
        case text
        case date
        case passportNumber
        case phoneNumber
        case email
    }
}

// MARK: - Preview

struct CustomTextField_Previews: PreviewProvider {    
    static var previews: some View {

        VStack {
            FloatingTextField(title: .constant("Тест ошибки"), text: .constant(""), isValid: .constant(false))
                .padding()
            FloatingTextField(title: .constant("Номер телефона"), text: .constant(""), isValid: .constant(true), type: .phoneNumber)
                .padding()
            FloatingTextField(title: .constant("Почта"), text: .constant(""), isValid: .constant(true), type: .email)
                .padding()
            FloatingTextField(title: .constant("Имя"), text: .constant(""), isValid: .constant(true))
                .padding()
            FloatingTextField(title: .constant("Дата рождения"), text: .constant(""), isValid: .constant(true), type: .date)
                .padding()
        }
        .padding(.all , 25)
    }
}
