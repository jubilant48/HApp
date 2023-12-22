//
//  CollapsibaleView.swift
//  Hotel
//
//  Created by macbook on 21.12.2023.
//

import SwiftUI

struct CollapsibaleView: View {
    // MARK: - Attributes
    
    var title: String
    
    @EnvironmentObject var tourist: TouristModel
    
    private let fontBold = FontFamily.SFProDisplay.bold
    private let blueColor = Asset.Colors._0d72ff.swiftUIColor
    private let arrowUp = Asset.Images.arrowUp
    private let arrowDown = Asset.Images.arrowDown
    private let buttonEdgeInset = EdgeInsets(top: 13, leading: 10, bottom: 13, trailing: 10)
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(fontBold, size: 22))
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
                    backgroundColor: blueColor.opacity(0.1),
                    foregroundColor: blueColor,
                    edgeInset: buttonEdgeInset)
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
                .transition(.opacity)
            }
            
        }
    }
}

// MARK: - Preview

struct CollapsibaleView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Section {
                CollapsibaleView(title: "Первый турис")
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(15)
            .padding()
            
            Section {
                CollapsibaleView(title: "Второй турис")
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(15)
            .padding()
            
        }
        .background(Color.gray)
    }
}
