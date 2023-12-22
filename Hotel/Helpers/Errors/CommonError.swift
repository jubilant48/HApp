//
//  CommonError.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

// MARK: - Enumeration

enum CommonError {
    case unwrappingError(_ fileID: String, _ line: Int)
    case castingError(_ fileID: String, _ line: Int)
}

// MARK: - Extension

extension CommonError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unwrappingError(let fileID, let line):
            return NSLocalizedString("Ошибка распаковки в \(fileID) на строке \(line)", comment: "")
        case .castingError(let fileID, let line):
            return NSLocalizedString("Ошибка приведения типа в \(fileID) на строке \(line)", comment: "")
        }
    }
}
