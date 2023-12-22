//
//  Hotel.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

struct Hotel {
    var id: Int
    var name: String
    var adress: String
    var minimalPrice: Int
    var priceForIt: String
    var rating: Int
    var ratingName: String
    var imageUrls: [URL]
    var aboutTheHotel: AboutTheHotel
}

// MARK: - Extension

extension Hotel: Codable { }
