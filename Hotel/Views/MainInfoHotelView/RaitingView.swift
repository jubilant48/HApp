//
//  RaitingView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI
import SFSafeSymbols

// MARK: - Constant

extension RaitingView {
    struct Constant {
        let cornerRadius: CGFloat = 5
        
        let fivePadding: CGFloat = 5
        let tenPadding: CGFloat = 10
        
        let fontMedium = GeneralConstatnt.fontMedium
        let fontSize: CGFloat = 17
        
        let textColor = Color(asset: Asset.Colors.ffa800)
        let backgroundColor = Color(asset: Asset.Colors.ffc700)
    }
}

struct RaitingView: View {
    // MARK:  - Attributes
    
    var rating: Int
    var title: String
    
    private let constant = Constant()
    
    var body: some View {
        Section {
            HStack {                
                Text("\(Image(systemSymbol: .starFill)) \(rating) \(title)")
                    .font(
                        .custom(constant.fontMedium, size: constant.fontSize)
                    )
                    .foregroundColor(constant.textColor)
            }
            .padding([.leading, .trailing], constant.tenPadding)
            .padding([.top, .bottom], constant.fivePadding)
        }
        .background(
            Rectangle()
                .foregroundColor(constant.backgroundColor)
                .cornerRadius(constant.cornerRadius)
        )
    }
}
