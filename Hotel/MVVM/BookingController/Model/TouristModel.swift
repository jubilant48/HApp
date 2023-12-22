//
//  TouristModel.swift
//  Hotel
//
//  Created by macbook on 21.12.2023.
//

import SwiftUI

final class TouristModel: ObservableObject, Identifiable {
    // MARK: - Attributes
    
    @Published var isExpensed: Bool
    
    @Published var name: String
    @Published var isValidName: Bool = true
    
    @Published var surname: String
    @Published var isValidSurname: Bool = true
    
    @Published var birthday: String
    @Published var isValidBirthday: Bool = true
    
    @Published var citizenship: String
    @Published var isValidCitizenship: Bool = true
    
    @Published var passportNumber: String
    @Published var isValidPassportNumber: Bool = true
    
    @Published var passportValidityPeriod: String
    @Published var isValidPassportValidityPeriod: Bool = true
    
    let id = UUID()
    let index: Int
    
    // MARK: - Init
    
    init(isExpensed: Bool, index: Int) {
        self.name = ""
        self.surname = ""
        self.birthday = ""
        self.citizenship = ""
        self.passportNumber = ""
        self.passportValidityPeriod = ""
        self.isExpensed = isExpensed
        self.index = index
    }
}

// MARK: - Hashable

extension TouristModel: Hashable {
    static func == (lhs: TouristModel, rhs: TouristModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
