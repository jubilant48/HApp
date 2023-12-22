//
//  PriceView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

struct PriceView: View {
    // MARK: - Attributes
    
    var priceForIt: String
    private let title: String
    
    private let foregroundColor = Color(asset: Asset.Colors._828796)
    private let sfProDisplayBold = FontFamily.SFProDisplay.bold
    private let sfProDisplayRegular = FontFamily.SFProDisplay.regular
    
    var body: some View {
        HStack() {
            Text(title)
                .font(.custom(sfProDisplayBold, size: 30))
                .multilineTextAlignment(.leading)
                .padding(.leading, -35)
            
            Text(priceForIt.lowercased())
                .font(.custom(sfProDisplayRegular, size: 17))
                .multilineTextAlignment(.leading)
                .baselineOffset(-10)
                .foregroundColor(foregroundColor)
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

// MARK: - Preview

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(from: 134268, forIt: "За тур с перелётом")
    }
}
