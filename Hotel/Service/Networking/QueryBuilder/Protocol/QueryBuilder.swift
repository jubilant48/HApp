//
//  QueryBuilder.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

final class QueryBuilder: QueryBuilderProtocol {
    // MARK: - Attributes
    
    var scheme: String?
    var host: String?
    var path: String?
    
    // MARK: - Protocol methods
    
    func set(scheme: QueryModel.Scheme) -> Self {
        self.scheme = scheme.asString
        
        return self
    }
    
    func set(host: QueryModel.Host) -> Self {
        self.host = host.asString
        
        return self
    }
    
    func add(path: QueryModel.Path) -> Self {
        if var tempPath = self.path {
            tempPath += path.asString
            self.path = tempPath
        } else {
            self.path = path.asString
        }
        
        return self
    }
    
    func add(path: String) -> Self {
        if var tempPath = self.path {
            tempPath += path
            self.path = tempPath
        } else {
            self.path = path
        }
        
        return self
    }
    
    func create<T: Decodable>(type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: getRequest())
        
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
    
    // MARK: - Methods
    
    private func getRequest() throws -> URLRequest {
        var components = URLComponents()
        
        guard let path = self.path else {
            throw CommonError.unwrappingError(#fileID, #line)
        }
        
        components.scheme = scheme
        components.host = host
        components.path = path
        
        guard let url = components.url else {
            throw CommonError.unwrappingError(#fileID, #line)
        }
        
        let request = URLRequest(url: url)
        
        return request
    }
    
}
