//
//  PlusTouristView.swift
//  Hotel
//
//  Created by macbook on 21.12.2023.
//

import SwiftUI
import SFSafeSymbols

struct PlusTouristView: View {
    // MARK: - Attributes
    
    @EnvironmentObject var model: BookingVControllerVModel
    
    @State var isDesabled: Bool = false
    
    private let fontBold = FontFamily.SFProDisplay.bold
    private let plus = SFSymbol.plus
    private let blueColor = Asset.Colors._0d72ff.swiftUIColor
    private let buttonEdgeInset = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    
    var body: some View {
        HStack {
            Text("Добавить туриста")
                .font(.custom(fontBold, size: 22))
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Button {
                withAnimation() {
                    model.addTourist()
                    
                    if model.tourists.count > 10 {
                        isDesabled = true
                    }
                }
            } label: {

                Image(systemSymbol: plus)
            }
            .buttonStyle(TagButtonStyle(
                backgroundColor: isDesabled ? blueColor.opacity(0.01) : blueColor,
                foregroundColor: Color.white,
                edgeInset: buttonEdgeInset)
            )
            .disabled(isDesabled)
        }
    }
}

// MARK: - Preview

struct PlusTouristView_Previews: PreviewProvider {
    static var previews: some View {
        PlusTouristView()
    }
}
