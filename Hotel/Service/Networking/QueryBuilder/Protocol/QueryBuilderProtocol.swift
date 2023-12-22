//
//  QueryBuilderProtocol.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

protocol QueryBuilderProtocol {
    func set(scheme: QueryModel.Scheme) -> Self
    func set(host: QueryModel.Host) -> Self
    func add(path: QueryModel.Path) -> Self
    func add(path: String) -> Self
    
    func create<T: Decodable>(type: T.Type) async throws -> T
    func create(from url: URL) async throws -> UIImage
}
