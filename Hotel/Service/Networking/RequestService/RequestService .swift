//
//  RequestService .swift
//  Hotel
//
//  Created by macbook on 04.01.2024.
//

import SwiftUI

final class RequestService {
    func create<T: Decodable>(request: URLRequest, type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.dataNotFound(fileID: #fileID, line: #line)
        }
        
        let decoded = try JSONHelper.decodeJSON(type: type, from: data)
        
        return decoded
    }
    
    func create(from url: URL) async throws -> UIImage {
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.dataNotFound(fileID: #fileID, line: #line)
        }
        
        guard let uiImage = UIImage(data: data) else {
            throw CommonError.unwrappingError(#fileID, #line)
        }
        
        return uiImage
    }
}
