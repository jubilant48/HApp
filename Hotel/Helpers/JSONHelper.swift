//
//  JSONHelper.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

final class JSONHelper {
    static func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) throws -> T {
        guard let data = data else {
            throw CommonError.unwrappingError(#fileID, #line)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let response = try? decoder.decode(type.self, from: data) else {
            throw CommonError.castingError(#fileID, #line)
        }
        
        return response
    }
}
