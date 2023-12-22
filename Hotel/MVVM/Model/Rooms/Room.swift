//
//  Room.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

struct Room {
    var id: Int
    var name: String
    var price: Int
    var pricePer: String
    var peculiarities: [String]
    var imageUrls: [URL]
}

// MARK: - Extension

extension Room: Codable { }
extension Room: Hashable { }
