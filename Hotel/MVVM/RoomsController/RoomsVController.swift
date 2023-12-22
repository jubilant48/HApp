//
//  RoomsController.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

struct RoomsVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: RoomsVControllerVModel
    
    var body: some View {
        CustomScrollView(title: viewModel.title) {
            if let rooms = viewModel.model {
                ForEach(rooms.rooms, id: \.self) { room in
                    RoomCell(imageUrls: room.imageUrls,
                             title: room.name,
                             tags: room.peculiarities,
                             price: room.price,
                             pricePer: room.pricePer,
                             transition: viewModel.transition)
                    .padding(.bottom, 4)
                }
            }
        }
    }
}

// MARK: - Priview

struct RoomsVController_Previews: PreviewProvider {
    static var previews: some View {
        RoomsVController(
            viewModel: RoomsVControllerVModel(title: "Лучший пятизвёздочный отель в Хургаде, Египет",
                                              appCoordinator: MainVController_Previews.appCoordinator)
        )
    }
}
