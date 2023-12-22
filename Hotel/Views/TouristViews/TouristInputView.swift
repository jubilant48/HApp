//
//  TouristInputView.swift
//  Hotel
//
//  Created by macbook on 21.12.2023.
//

import SwiftUI

struct TouristInputView: View {
    // MARK: - Attribute

    @EnvironmentObject var data: TouristModel

    var body: some View {
            FloatingTextField(title: .constant("Имя"),
                              text: $data.name,
                              isValid: $data.isValidName)
            .padding()
            FloatingTextField(title: .constant("Фамилия"),
                              text: $data.surname,
                              isValid: $data.isValidSurname)
            .padding()
            FloatingTextField(title: .constant("Дата рождения"),
                              text: $data.birthday,
                              isValid: $data.isValidBirthday,
                              type: .date)
            .padding()
            FloatingTextField(title: .constant("Гражданство"),
                              text: $data.citizenship,
                              isValid: $data.isValidCitizenship)
            .padding()
            FloatingTextField(title: .constant("Номер загранпаспорта"),
                              text: $data.passportNumber,
                              isValid: $data.isValidPassportNumber,
                              type: .passportNumber)
            .padding()
            FloatingTextField(title: .constant("Срок действия загранпаспорта"),
                              text: $data.passportValidityPeriod,
                              isValid: $data.isValidPassportValidityPeriod,
                              type: .date)
            .padding()
    }
}

// MARK: - Preview

struct TouristInputView_Previews: PreviewProvider {

    static var previews: some View {
        TouristInputView()
    }
}
