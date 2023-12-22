//
//  HotelApp.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

@main
struct HotelApp: App {
    // MARK: - Attributes
    
    @StateObject var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MainVController()
                .environmentObject(appCoordinator)
        }
    }
}
