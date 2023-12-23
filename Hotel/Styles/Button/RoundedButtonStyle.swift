//
//  RoundedButtonStyle.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    var backgroundColor = Color(asset: Asset.Colors._0d72ff)
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(.white)
            .font(.custom(FontFamily.SFProDisplay.regular, size: 17))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 15)
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .foregroundColor(configuration.isPressed ? backgroundColor.opacity(0.6) : backgroundColor)
                        .cornerRadius(15)
                })
    }
}

// MARK: - Preview

struct RoundedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Супер!") {}
            .buttonStyle(RoundedButtonStyle())
    }
}
