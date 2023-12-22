//
//  Int + Extension.swift
//  Hotel
//
//  Created by macbook on 22.12.2023.
//

import Foundation

extension Int {
    var asOrdinalRus: String {
        if self == 1 {
            return "Первый"
        } else if self == 2 {
            return "Второй"
        } else if self == 3 {
            return "Третий"
        } else if self == 4 {
            return "Четвертый"
        } else if self == 5 {
            return "Пятый"
        } else if self == 6 {
            return "Шестой"
        } else if self == 7 {
            return "Седьмой"
        } else if self == 8 {
            return "Восьмой"
        } else if self == 9 {
            return "Девятый"
        } else if self == 10 {
            return "Десятый"
        } else {
            return ""
        }
    }
}
