//
//  HotelTitleView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

struct HotelTitleView: View {
    // MARK: - Attributes
    
    var name: String
    var adress: String
    
    private let foregroundColor = Color(asset: Asset.Colors._0d72ff)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(
                    .custom(FontFamily.SFProDisplay.bold, size: 22)
                )
                .multilineTextAlignment(.leading)
                .padding(.bottom, 4)
                .padding(.leading, -18)
            
            Button(action: {}) {
                Text(adress)
                    .font(.custom(FontFamily.SFProDisplay.regular, size: 15))
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .padding(.leading, -18)
                    .foregroundColor(foregroundColor)
    
            }
        }
    }
}

// MARK: - Preview

struct HotelTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HotelTitleView(name: "Лучший пятизвёздочный отель в Хургаде, Египет",
                       adress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет")
    }
}
