//
//  Validation.swift
//  Hotel
//
//  Created by macbook on 22.12.2023.
//

import SwiftUI

final class Validation {
    // MARK: - Attributes
    
    private let country: [String] = [
        "российская федерация",
        "russian federation",
    ]
    
    private var dateOf1900: Date {
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "dd.MM.yyyy"
        
        return dateFormatted.date(from: "01.01.1900")!
    }
    
    private var tenYearsLater: Date {
        let currentDate = Date()
        var dateComponent = DateComponents()
         
        dateComponent.year = 10
        print(Calendar.current.date(byAdding: dateComponent, to: currentDate)!)
        return Calendar.current.date(byAdding: dateComponent, to: currentDate)!
    }
    
    // MARK: - Methods
    
    func isValidName(_ name: String) -> Bool {
        name.count >= 3
    }
    
    func isValidSurname(_ surname: String) -> Bool {
        surname.count >= 3
    }
    
    func isValidPhoneNumber(_ number: String) -> Bool {
        number.count == 10
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidBirthday(_ birthday: String) -> Bool {
        guard let birthday = convert(birthday) else {
            return false
        }
        let now = Date()
        
        return birthday < now && birthday > dateOf1900
    }
    
    func isValidCitizenship(_ citizenship: String) -> Bool {
        print(citizenship)
        return country.contains(citizenship.lowercased())
    }
    
    func isValidPassportNumber(_ number: String) -> Bool {
        return number.count == 9
    }
    
    func isValidPassportValidityPeriod(_ date: String) -> Bool {
        guard let validityPeriod = convert(date) else {
            return false
        }
        let now = Date()
        
        return validityPeriod > now && validityPeriod < tenYearsLater
    }
}

// MARK: - Private methods

extension Validation {
    private func convert(_ string: String) -> Date? {
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = "ddMMyyyy"
        
        guard !string.isEmpty,
              let date = dateFormatted.date(from: string) else {
            return nil
        }
        
        return date
    }
}
