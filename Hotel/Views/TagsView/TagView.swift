//
//  PeculiarityViewCell.swift
//  Hotel
//
//  Created by macbook on 18.12.2023.
//

import SwiftUI

struct TagView: View {
    // MARK: - Attributes
    
    var tag: String
    
    let backgroundColor = Color(asset: Asset.Colors.fbfbfc151515)
    let foregroundColor = Color(asset: Asset.Colors._828796)
    
    private let font = FontFamily.SFProDisplay.regular
    
    var body: some View {
        Text(tag)
            .padding(EdgeInsets(top: 5,
                                leading: 10,
                                bottom: 5,
                                trailing: 10))
            .font(
                .custom(font, size: 16)
            )
            .multilineTextAlignment(.leading)
            .background(backgroundColor)
            .cornerRadius(5)
            .foregroundColor(foregroundColor)
    }
    
    // MARK: - Init
    
    init(_ tag: String) {
        self.tag = tag
    }
}

// MARK: - Preview

struct PeculiarityView_Previews: PreviewProvider {
    static var previews: some View {
        TagView("Бесплатный Wifi на всей территории отеля")
    }
}
