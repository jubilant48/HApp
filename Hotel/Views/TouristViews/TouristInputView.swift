//
//  TouristInputView.swift
//  Hotel
//
//  Created by macbook on 21.12.2023.
//

import SwiftUI

// MARK: - Constant

extension TouristInputView {
    struct Constant {
        let nameTitle = "Имя"
        let surnameTitle = "Фамилия"
        let birthdayTitle = "Дата рождения"
        let citizenshipTitle = "Гражданство"
        let passportNumberTitle = "Номер загранпаспорта"
        let passportValidityPeriodTitle = "Срок действия загранпаспорта"
    }
}

struct TouristInputView: View {
    // MARK: - Attribute

    @EnvironmentObject var data: TouristModel
    
    private let constant = Constant()

    var body: some View {
        FloatingTextField(title: .constant(constant.nameTitle),
                          text: $data.name,
                          isValid: $data.isValidName)
        .padding()
        FloatingTextField(title: .constant(constant.surnameTitle),
                          text: $data.surname,
                          isValid: $data.isValidSurname)
        .padding()
        FloatingTextField(title: .constant(constant.birthdayTitle),
                          text: $data.birthday,
                          isValid: $data.isValidBirthday,
                          type: .date)
        .padding()
        FloatingTextField(title: .constant(constant.citizenshipTitle),
                          text: $data.citizenship,
                          isValid: $data.isValidCitizenship)
        .padding()
        FloatingTextField(title: .constant(constant.passportNumberTitle),
                          text: $data.passportNumber,
                          isValid: $data.isValidPassportNumber,
                          type: .passportNumber)
        .padding()
        FloatingTextField(title: .constant(constant.passportValidityPeriodTitle),
                          text: $data.passportValidityPeriod,
                          isValid: $data.isValidPassportValidityPeriod,
                          type: .date)
        .padding()
    }
}
