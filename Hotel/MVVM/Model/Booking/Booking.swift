//
//  Booking.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

struct Booking {
    var id: Int
    var hotelName: String
    var hotelAdress: String
    var horating: Int
    var ratingName: String
    var departure: String
    var arrivalCountry: String
    var tourDateStart: String
    var tourDateStop: String
    var numberOfNights: Int
    var room: String
    var nutrition: String
    var tourPrice: Int
    var fuelCharge: Int
    var serviceCharge: Int
}

// MARK: - Extension

extension Booking: Codable { }
