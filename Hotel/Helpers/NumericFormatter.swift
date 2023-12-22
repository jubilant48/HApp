//
//  CurrencyFormatter.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

final class NumericFormatter {
    // MARK: - Enumeration
    
    enum Locale: String {
        case ru = "ru_UA"
        case us = "us_US"
    }
    
    // MARK: - Methods
    
    static func rounding(_ number: Double, afterDecimalPoint amount: Int) -> String {
        return String(format: "%.\(amount)f", number)
    }
    
    static func currncyFormat<T: Numeric>(_ numeric: T, format: Locale) -> String {
        let formatter = NumberFormatter(numberStyle: .currency, locale: format.rawValue.toLocale)
        let numericFormat = numeric.format(formatter: formatter)!
        
        return numericFormat
    }
    
    static func decimalFormat(_ numeric: Double, format: Locale) -> String {
        let formatter = NumberFormatter(numberStyle: .decimal, locale: format.rawValue.toLocale)
        let numericFormat = numeric.format(formatter: formatter)!
        
        return numericFormat
    }
}

