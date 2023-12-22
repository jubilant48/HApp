//
//  NetworkError .swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

// MARK: - Enumeration

enum NetworkError {
    case dataNotFound(fileID: String, line: Int)
}

// MARK: - Extension

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataNotFound(fileID: let fileID, line: let line):
            return NSLocalizedString("Данные по запросу в \(fileID) на строке \(line) не найденны.", comment: "")
        }
    }
}
