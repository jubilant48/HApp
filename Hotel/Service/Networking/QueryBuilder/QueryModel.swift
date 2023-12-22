//
//  QueryBuilder + Model.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

final class QueryModel {}

// MARK: - Scheme

extension QueryModel {
    enum Scheme: String {
        case http = "http"
        case https = "https"
        
        var asString: String {
            switch self {
            case .http:
                return self.rawValue
            case .https:
                return self.rawValue
            }
        }
    }
}

// MARK: - Host

extension QueryModel {
    enum Host {
        case mocky
        
        var asString: String {
            switch self {
            case .mocky:
                return "run.mocky.io"
            }
        }
    }
}

// MARK: - Path

extension QueryModel {
    enum Path: String {
        case v3 = "/v3"
        case slash = "/"
        
        var asString: String {
            switch self {
            case .v3:
                return self.rawValue
            case .slash:
                return self.rawValue
            }
        }
    }
}
