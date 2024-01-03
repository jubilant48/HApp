//
//  AdditionalButtons.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

// MARK: - Constant

extension AdditionalButtons {
    struct Constant {
        let cornerRadius: CGFloat = 15
        
        let fivePadding: CGFloat = 5
        let tenPadding: CGFloat = 10
        let fifteenPadding: CGFloat = 15
        let padding = GeneralConstatnt.padding
        
        let fontMedium = FontFamily.SFProDisplay.medium
        let fontRegular = FontFamily.SFProDisplay.regular
        let fontSize: CGFloat = 17
        
        let textWidth: CGFloat = 200
        
        let facilitiesTitle = "Удобства"
        let whatIncludedTitle = "Что включено"
        let whatNotIncludedTitle = "Что не включено"
        let essentialsTitle = "Самое необходимое"
        
        let sectionBackgroundColor = Asset.Colors.fbfbfc151515.swiftUIColor
        let textColor = Asset.Colors._000000Ffffff.swiftUIColor
        let secondaryTextColor = Asset.Colors._828796.swiftUIColor
    }
}

struct AdditionalButtons: View {
    // MARK: - Attributes
        
    private let constant = Constant()
    
    private let emojiHappyImage = Asset.Images.emojiHappy.swiftUIImage
    private let tickSquareImage = Asset.Images.tickSquare.swiftUIImage
    private let closeSquareImage = Asset.Images.closeSquare.swiftUIImage
    private let arrowImage = Asset.Images.blackRightArrow.swiftUIImage
    
    var body: some View {
        VStack {
            
            VStack {
                Button(action: {}) {
                    HStack {
                        emojiHappyImage
                            .padding([.trailing, .bottom], constant.fivePadding)
                        
                        ZStack(alignment: .bottom) {
                            HStack {
                                VStack {
                                    Text(constant.facilitiesTitle)
                                        .font(
                                            .custom(constant.fontMedium, size: constant.fontSize)
                                        )
                                        .foregroundColor(constant.textColor)
                                        .frame(width: constant.textWidth, alignment: .leading)
                                    
                                    Text(constant.essentialsTitle)
                                        .font(
                                            .custom(constant.fontRegular, size: constant.fontSize)
                                        )
                                        .foregroundColor(constant.secondaryTextColor)
                                        .frame(width: constant.textWidth, alignment: .leading)
                                }
                                Spacer()
                                arrowImage
                            }
                            .padding(.bottom, constant.tenPadding)
                            
                            Divider()
                                .padding(.trailing, constant.tenPadding)
                        }
                    }
                }
                
                Button(action: {}) {
                    HStack {
                        tickSquareImage
                            .padding([.trailing, .bottom], constant.fivePadding)
                        
                        ZStack(alignment: .bottom) {
                            HStack {
                                VStack {
                                    Text(constant.whatIncludedTitle)
                                        .font(
                                            .custom(constant.fontMedium, size: constant.fontSize)
                                        )
                                        .foregroundColor(constant.textColor)
                                        .frame(width: constant.textWidth, alignment: .leading)
                                    
                                    Text(constant.essentialsTitle)
                                        .font(
                                            .custom(constant.fontRegular, size: constant.fontSize)
                                        )
                                        .foregroundColor(constant.secondaryTextColor)
                                        .frame(width: constant.textWidth, alignment: .leading)
                                }
                                Spacer()
                                arrowImage
                            }
                            .padding(.bottom, constant.tenPadding)
                            
                            Divider()
                                .padding(.trailing, constant.tenPadding)
                        }
                    }
                }
                
                Button(action: {}) {
                    HStack {
                        closeSquareImage
                            .padding(.trailing, constant.fivePadding)
                        
                        Group {
                            VStack {
                                Text(constant.whatNotIncludedTitle)
                                    .font(
                                        .custom(constant.fontMedium, size: constant.fontSize)
                                    )
                                    .foregroundColor(constant.textColor)
                                    .frame(width: constant.textWidth, alignment: .leading)
                                
                                Text(constant.essentialsTitle)
                                    .font(
                                        .custom(constant.fontRegular, size: constant.fontSize)
                                    )
                                    .foregroundColor(constant.secondaryTextColor)
                                    .frame(width: constant.textWidth, alignment: .leading)
                            }
                            Spacer()
                            arrowImage
                        }
                    }
                }
                
            }
            .padding(.all, constant.fifteenPadding)
            
        }
        .background(constant.sectionBackgroundColor)
        .cornerRadius(constant.cornerRadius)
        .padding(.all, constant.padding)
    }
}
