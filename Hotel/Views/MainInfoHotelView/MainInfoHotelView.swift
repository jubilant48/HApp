//
//  MainInfoHotelView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

// MARK: - Constant

extension MainInfoHotelView {
    struct Constant {
        let padding: CGFloat = GeneralConstatnt.padding
    }
}

struct MainInfoHotelView: View {
    // MARK: - Attributes
    
    let name: String
    let adress: String
    let rating: Int
    let ratingName: String
    
    private let constant = Constant()
    
    var body: some View {
        VStack {
            HStack {
                RaitingView(rating: rating,
                            title: ratingName)

                Spacer()
            }
            
            HotelTitleView(name: name, adress: adress)
                .padding([.leading, .trailing], constant.padding)
        }
    }
}
