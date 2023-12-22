//
//  MainInfoHotelView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

struct MainInfoHotelView: View {
    // MARK: - Attributes
    
    let name: String
    let adress: String
    let rating: Int
    let ratingName: String
    
    var body: some View {
        VStack {
            HStack {
                RaitingView(rating: rating,
                            title: ratingName)

                Spacer()
            }
            
            HotelTitleView(name: name, adress: adress)
                .padding([.leading, .trailing],
                         Constant.GeneralConstatnt.padding)
        }
    }
}

// MARK: - Preview

struct MainInfoHotelView_Previews: PreviewProvider {
    static var previews: some View {
        MainInfoHotelView(name: "Лучший пятизвёздочный отель в Хургаде, Египет",
                          adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
                          rating: 5,
                          ratingName: "Превосходно")
    }
}
