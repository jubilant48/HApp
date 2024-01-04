//
//  AppCoordinator.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

@MainActor
final class AppCoordinator: ObservableObject {
    // MARK: - Attributes
    
    @Published var path = NavigationPath()
    
    // MARK: - Methods
    
    func push(_ controller: Controller, title: String = "") {
        switch controller {
        case .hotel:
            break
        case .rooms(_):
            path.append(Controller.rooms(title: title))
        case .booking:
            path.append(Controller.booking)
        case .acceptOrder:
            path.append(Controller.acceptOrder)
        }
    }
    
    func pop() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func getController(_ controller: Controller) -> some View {
        switch controller {
        case .hotel:
            HotelVController(viewModel: HotelVControllerVModel(appCoordinator: self))
        case .rooms(let title):
            RoomsVController(viewModel: RoomsVControllerVModel(title: title, appCoordinator: self))
        case .booking:
            BookingVController(viewModel: BookingVControllerVModel(appCoordinator: self))
        case .acceptOrder:
            AcceptVController(viewModel: AcceptVControllerVModel(appCoordinator: self))
        }
    }
}

// MARK: - Extension

extension AppCoordinator {
    enum Controller: Identifiable, Hashable {
        case hotel
        case rooms(title: String)
        case booking
        case acceptOrder
        
        var id: String {
            switch self {
            case .hotel:
                return "hotel"
            case .rooms(let title):
                return title
            case .booking:
                return "booking"
            case .acceptOrder:
                return "acceptOrder"
            }
        }
    }
}
