//
//  RaitingView.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI
import SFSafeSymbols

struct RaitingView: View {
    var rating: Int
    var title: String
    
    private let cornerRadius: CGFloat = 5
    private let textColor = Color(asset: Asset.Colors.ffa800)
    private let backgroundColor = Color(asset: Asset.Colors.ffc700)
    
    var body: some View {
        Section {
            HStack {                
                Text("\(Image(systemSymbol: .starFill)) \(rating) \(title)")
                    .font(.custom(FontFamily.SFProDisplay.medium, size: 17))
                    .foregroundColor(textColor)
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
        }
        .background(
            Rectangle()
                .foregroundColor(backgroundColor)
                .cornerRadius(cornerRadius)
        )
    }
}

// MARK: - Preview

struct RaitingView_Previews: PreviewProvider {
    static var previews: some View {
        RaitingView(rating: 5, title: "Превосходно")
            .previewLayout(.sizeThatFits)
    }
}
