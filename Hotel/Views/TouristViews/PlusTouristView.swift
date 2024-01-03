//
//  PlusTouristView.swift
//  Hotel
//
//  Created by macbook on 21.12.2023.
//

import SwiftUI
import SFSafeSymbols

// MARK: - Constant

extension PlusTouristView {
    struct Constant {
        let fontBold = GeneralConstatnt.fontBold
        let fontBoldSize: CGFloat = 22
        
        let foregroundColor = Color.white
        let blueColor = Asset.Colors._0d72ff.swiftUIColor
        
        let buttonEdgeInset = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let opacity: CGFloat = 0.01
        
        let addTouristTitle = "Добавить туриста"
    }
}

struct PlusTouristView: View {
    // MARK: - Attributes
    
    @EnvironmentObject var model: BookingVControllerVModel
    
    @State var isDesabled: Bool = false
    
    private let constant = Constant()
    
    private let plus = SFSymbol.plus
    
    var body: some View {
        HStack {
            Text(constant.addTouristTitle)
                .font(
                    .custom(constant.fontBold, size: constant.fontBoldSize)
                )
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
                backgroundColor: isDesabled ? constant.blueColor.opacity(constant.opacity) : constant.blueColor,
                foregroundColor: constant.foregroundColor,
                edgeInset: constant.buttonEdgeInset)
            )
            .disabled(isDesabled)
        }
    }
}
