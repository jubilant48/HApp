//
//  PriceView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

// MARK: - Constant

extension PriceView {
    struct Constant {
        let padding: CGFloat = -35
        
        let fontBold = GeneralConstatnt.fontBold
        let fontBoldSize: CGFloat = 30
        let fontRegular = GeneralConstatnt.fontRegular
        let fontRegularSize: CGFloat = 17
        
        let foregroundColor = Color(asset: Asset.Colors._828796)
        
        let baselineOffset: CGFloat = -10
    }
}

struct PriceView: View {
    // MARK: - Attributes
    
    var priceForIt: String
    private let title: String
    
    private let constant = Constant()
    
    var body: some View {
        HStack() {
            Text(title)
                .font(
                    .custom(constant.fontBold, size: constant.fontBoldSize)
                )
                .multilineTextAlignment(.leading)
                .padding(.leading, constant.padding)
            
            Text(priceForIt.lowercased())
                .font(
                    .custom(constant.fontRegular, size: constant.fontRegularSize)
                )
                .multilineTextAlignment(.leading)
                .baselineOffset(constant.baselineOffset)
                .foregroundColor(constant.foregroundColor)
        }
    }
    
    // MARK: - Init
    
    init(from price: Int, forIt additionalInfo: String) {
        self.title = "от \(NumericFormatter.decimalFormat(Double(price), format: .ru)) ₽"
        self.priceForIt = additionalInfo
    }
    
    init(_ price: Int, per additionalInfo: String) {
        self.title = "\(NumericFormatter.decimalFormat(Double(price), format: .ru)) ₽"
        self.priceForIt = additionalInfo
    }
}
