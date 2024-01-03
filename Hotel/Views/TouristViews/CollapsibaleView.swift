//
//  CollapsibaleView.swift
//  Hotel
//
//  Created by macbook on 21.12.2023.
//

import SwiftUI

// MARK: - Constant

extension CollapsibaleView {
    struct Constant {
        let fontBold = GeneralConstatnt.fontBold
        let fontBoldSize: CGFloat = 22
        
        let blueColor = Asset.Colors._0d72ff.swiftUIColor
        
        let buttonEdgeInset = EdgeInsets(top: 13, leading: 10, bottom: 13, trailing: 10)
        let opacity: CGFloat = 0.1
    }
}

struct CollapsibaleView: View {
    // MARK: - Attributes
    
    var title: String
    
    @EnvironmentObject var tourist: TouristModel
    
    private let constant = Constant()
    
    private let arrowUp = Asset.Images.arrowUp
    private let arrowDown = Asset.Images.arrowDown
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(constant.fontBold, size: constant.fontBoldSize))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button {
                    withAnimation() {
                        tourist.isExpensed.toggle()
                    }
                } label: {
                    Image(asset: tourist.isExpensed ? arrowUp : arrowDown)
                }
                .buttonStyle(TagButtonStyle(
                    backgroundColor: constant.blueColor.opacity(constant.opacity),
                    foregroundColor: constant.blueColor,
                    edgeInset: constant.buttonEdgeInset)
                )
            }
            
            if tourist.isExpensed {
                VStack {
                    TouristInputView()
                        .environmentObject(tourist)
                }
                .frame(height: tourist.isExpensed ? nil : 0)
                .clipped()
                .animation(.easeOut, value: UUID())
                .transition(.slide)
            }
            
        }
    }
}
