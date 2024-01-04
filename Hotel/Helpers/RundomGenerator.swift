//
//  RundomGenerator.swift
//  Hotel
//
//  Created by macbook on 04.01.2024.
//

import SwiftUI

struct RundomGenerator {
    static func rundomOrder() -> Int {
        return Int.random(in: 100_000...999_999)
    }
}
