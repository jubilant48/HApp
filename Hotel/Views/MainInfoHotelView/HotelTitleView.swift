//
//  HotelTitleView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

// MARK: - Constant

extension HotelTitleView {
    struct Constant {
        let minusEighteenPadding: CGFloat = -18
        let fourPadding: CGFloat = 4
        
        let fontBold = GeneralConstatnt.fontBold
        let fontBoldSize: CGFloat = 22
        let fontRegular = GeneralConstatnt.fontRegular
        let fontRegularSize: CGFloat = 15
        
        let foregroundColor = Color(asset: Asset.Colors._0d72ff)
        
        let lineLimit = 1
    }
}

struct HotelTitleView: View {
    // MARK: - Attributes
    
    var name: String
    var adress: String
    
    private let constant = Constant()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(
                    .custom(constant.fontBold, size: constant.fontBoldSize)
                )
                .multilineTextAlignment(.leading)
                .padding(.bottom, constant.fourPadding)
                .padding(.leading, constant.minusEighteenPadding)
            
            Button(action: {}) {
                Text(adress)
                    .font(
                        .custom(constant.fontRegular, size: constant.fontRegularSize)
                    )
                    .multilineTextAlignment(.leading)
                    .lineLimit(constant.lineLimit)
                    .padding(.leading, constant.minusEighteenPadding)
                    .foregroundColor(constant.foregroundColor)
    
            }
        }
    }
}
