//
//  FloatingTextField.swift
//  Hotel
//
//  Created by macbook on 20.12.2023.
//

import SwiftUI
import AnyFormatKit
import AnyFormatKitSwiftUI

// MARK: - Constant

extension FloatingTextField {
    struct Constant {
        let fontRegular = GeneralConstatnt.fontRegular
        let fontRegularSize: CGFloat = 17
        
        let titleColor = Asset.Colors.a9abb7.swiftUIColor
        let rectangleColor = Asset.Colors.f6f6f9424242.swiftUIColor
        let alertColor = Asset.Colors.eb5757.swiftUIColor
        let textColor = Asset.Colors._000000Ffffff.swiftUIColor
        let clear = Color.clear
        
        let radius: CGFloat = 10
        let edgeInsets = EdgeInsets(top: -16, leading:  -16, bottom: -16, trailing: -16)
        let duration: CGFloat = 0.1
        
        let offsetOne: CGFloat = 0
        let offsetTwo: CGFloat = -27
        
        let scaleOne: CGFloat = 1
        let scaleTwo: CGFloat = 0.6
        
        let dateMask = "##.##.####"
        let phoneMask: (placeholder: String, textPattern: String, patternSymbol: Character) = ("+7", "+7 (***) *** ** **", "*")
        let passportNumberMask = "## #######"
    }
}

struct FloatingTextField: View {
    // MARK: - Attributes
    
    @Binding var title: String
    @Binding var text: String
    @Binding var isValid: Bool
    
    private let type: TextFieldType
    private let constant = Constant()
    
    @FocusState private var focusedField: Field?
    @State private var isTap: Bool = false

    var body: some View {
        getTextField(type: type)
            .background(
                Rectangle()
                    .foregroundColor(isValid ? constant.rectangleColor : constant.alertColor)
                    .cornerRadius(constant.radius)
                    .padding(constant.edgeInsets)
            )
            .animation(.easeOut(duration: constant.duration), value: text.isEmpty)
            .animation(.easeOut(duration: constant.duration), value: isTap)
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
                    .font(
                        .custom(constant.fontRegular, size: constant.fontRegularSize)
                    )
                    .foregroundColor(constant.titleColor)
                    .offset(y: text.isEmpty ? constant.offsetOne : constant.offsetTwo)
                    .scaleEffect(text.isEmpty ? constant.scaleOne : constant.scaleTwo, anchor: .leading)

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
                    .font(
                        .custom(constant.fontRegular, size: constant.fontRegularSize)
                    )
                    .foregroundColor(constant.titleColor)
                    .offset(y: text.isEmpty ? constant.offsetOne : constant.offsetTwo)
                    .scaleEffect(text.isEmpty ? constant.scaleOne : constant.scaleTwo, anchor: .leading)

                FormatTextField(unformattedText: $text,
                                textPattern: constant.dateMask)
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
                    .font(
                        .custom(constant.fontRegular, size: constant.fontRegularSize)
                    )
                    .foregroundColor(constant.titleColor)
                    .offset(y: !isTap ? constant.offsetOne : constant.offsetTwo)
                    .scaleEffect(!isTap ? constant.scaleOne : constant.scaleTwo, anchor: .leading)

                FormatStartTextField(unformattedText: $text,
                                     placeholder: constant.phoneMask.placeholder,
                                     formatter: PlaceholderTextInputFormatter(textPattern: constant.phoneMask.textPattern, patternSymbol: constant.phoneMask.patternSymbol))
                .keyboardType(.numberPad)
                .foregroundColor(isTap ? constant.textColor : constant.clear)
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
                    .font(
                        .custom(constant.fontRegular, size: constant.fontRegularSize)
                    )
                    .foregroundColor(constant.titleColor)
                    .offset(y: text.isEmpty ? constant.offsetOne : constant.offsetTwo)
                    .scaleEffect(text.isEmpty ? constant.scaleOne : constant.scaleTwo, anchor: .leading)

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
                    .font(
                        .custom(constant.fontRegular, size: constant.fontRegularSize)
                    )
                    .foregroundColor(constant.titleColor)
                    .offset(y: text.isEmpty ? constant.offsetOne : constant.offsetTwo)
                    .scaleEffect(text.isEmpty ? constant.scaleOne : constant.scaleTwo, anchor: .leading)

                FormatTextField(unformattedText: $text,
                                textPattern: constant.passportNumberMask)
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
