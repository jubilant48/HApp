//
//  QueryBuilder.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

final class QueryBuilder: QueryBuilderProtocol {
    // MARK: - Attributes
    
    private var scheme: String?
    private var host: String?
    private var path: String?
    
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
    
    func create<T: Decodable>(type: T.Type) async throws -> Decodable {
        let (data, response) = try await URLSession.shared.data(for: getRequest())
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed(fileID: #fileID, line: #line)
        }
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(type.self, from: data)
        
        return decoded
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
        
        // TEST
        print(url)
        
        var request = URLRequest(url: url)
        
        return request
    }
}
