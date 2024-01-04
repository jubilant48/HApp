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
    
    func create() throws -> URLRequest {
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
