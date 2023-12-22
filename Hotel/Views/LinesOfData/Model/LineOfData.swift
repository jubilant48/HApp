//
//  LineOfData.swift
//  Hotel
//
//  Created by macbook on 22.12.2023.
//

import SwiftUI

final class LineOfData: Identifiable {
    // MARK: - Attributes
    
    var name: String
    var data: String
    
    let id = UUID()
    
    // MARK: - Init
    
    init(name: String, data: String) {
        self.name = name
        self.data = data
    }
}

// MARK: - Hashable

extension LineOfData: Hashable {
    static func == (lhs: LineOfData, rhs: LineOfData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


