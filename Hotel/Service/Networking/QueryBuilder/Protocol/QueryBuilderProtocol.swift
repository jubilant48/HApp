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
    
    func create() throws -> URLRequest
}
