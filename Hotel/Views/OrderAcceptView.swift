//
//  OrderAcceptView.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

// MARK: - Constant

extension OrderAcceptView {
    struct Constant {
        let emojiPadding: CGFloat = 32
        let titlePadding: CGFloat = 20
        let descriptionPadding: CGFloat = 35
        
        let customFont = ""
        let customFontSize: CGFloat = 44
        
        let fontBold = GeneralConstatnt.fontBold
        let fontBoldSize: CGFloat = 22
        
        let fontRegular = GeneralConstatnt.fontRegular
        let fontRegularSize: CGFloat = 17
        
        let circleForegroundColor = Color(asset: Asset.Colors.f6f6f9424242)
        
        let emoji = "🎉"
        let emojiSize: CGFloat = 94
    }
}

struct OrderAcceptView: View {
    // MARK: - Attributes
    
    var title: String
    var description: String
    
    private let constant = Constant()
    
    var body: some View {
        VStack {
            Text(constant.emoji)
                .font(
                    .custom(constant.customFont, size: constant.customFontSize)
                )
                .frame(width: constant.emojiSize, height: constant.emojiSize)
                .background(Circle()
                    .foregroundColor(constant.circleForegroundColor))
                .padding(.bottom, constant.emojiPadding)

            
            Text(title)
                .font(
                    .custom(constant.fontBold, size: constant.fontBoldSize)
                )
                .multilineTextAlignment(.center)
                .padding(.bottom, constant.titlePadding)
            
            Text(description)
                .font(
                    .custom(constant.fontRegular, size: constant.fontRegularSize)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding([.leading, .trailing], constant.descriptionPadding)
                
        }
    }
}
