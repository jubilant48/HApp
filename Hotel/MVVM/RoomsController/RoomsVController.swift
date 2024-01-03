//
//  RoomsController.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

// MARK: - Constant

extension RoomsVController {
    struct Constant {
        let bottomPadding: CGFloat = 4
    }
}

struct RoomsVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: RoomsVControllerVModel
    
    private let constant = Constant()
    
    var body: some View {
        GeometryReader { geometry in
            
            if let rooms = viewModel.model {
                
                CustomScrollView(title: viewModel.title) {
                    ForEach(rooms.rooms, id: \.self) { room in
                        RoomCell(imageUrls: room.imageUrls,
                                 title: room.name,
                                 tags: room.peculiarities,
                                 price: room.price,
                                 pricePer: room.pricePer,
                                 transition: viewModel.transition)
                        .padding(.bottom, constant.bottomPadding)
                    }
                }
                
            } else {
                
                LoadView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
            
        } // - Geometry reader
    }
    
}
