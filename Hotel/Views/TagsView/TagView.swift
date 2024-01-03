//
//  PeculiarityViewCell.swift
//  Hotel
//
//  Created by macbook on 18.12.2023.
//

import SwiftUI

extension TagView {
    struct Constant {
        let cornerRadius: CGFloat = 5
        
        let font = GeneralConstatnt.fontRegular
        let fontSize: CGFloat = 16
        
        let edgeInsets = EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        let backgroundColor = Color(asset: Asset.Colors.fbfbfc151515)
        let foregroundColor = Color(asset: Asset.Colors._828796)
    }
}

struct TagView: View {
    // MARK: - Attributes
    
    var tag: String
    
    private let constant = Constant()
    
    var body: some View {
        Text(tag)
            .padding(constant.edgeInsets)
            .font(
                .custom(constant.font, size: constant.fontSize)
            )
            .multilineTextAlignment(.leading)
            .background(constant.backgroundColor)
            .cornerRadius(constant.cornerRadius)
            .foregroundColor(constant.foregroundColor)
    }
    
    // MARK: - Init
    
    init(_ tag: String) {
        self.tag = tag
    }
}
