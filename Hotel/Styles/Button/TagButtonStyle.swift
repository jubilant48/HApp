//
//  TagButtonStyle.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

struct TagButtonStyle: ButtonStyle {
    
    var backgroundColor: Color
    var foregroundColor: Color
    var edgeInset = EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
    
    private let cornerRadius: CGFloat = 5
    private let font = FontFamily.SFProDisplay.regular
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(foregroundColor)
            .font(.custom(font, size: 16))
            .padding(edgeInset)
            .background(
                Rectangle()
                    .foregroundColor(backgroundColor)
                    .cornerRadius(cornerRadius)
            )
    }
}

// MARK: - Preview

struct TagButtonStyle_Previews: PreviewProvider {
    
    private static let arrowImage = Asset.Images.blueRightArrow.swiftUIImage
    private static let color = Asset.Colors._0d72ff.swiftUIColor
    
    static var previews: some View {
        Button(action: {}) {
            HStack{
                Text("Подробнее о номере")
                arrowImage
                    .foregroundColor(color)
                    .padding(.leading, -8)
            }
            
        }
        .buttonStyle(TagButtonStyle(backgroundColor: color.opacity(0.1),
                                   foregroundColor: color))
    }
}
