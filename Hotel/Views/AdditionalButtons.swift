//
//  AdditionalButtons.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

struct AdditionalButtons: View {
    // MARK: - Attributes
    
    private let sfProDisplayMedium = FontFamily.SFProDisplay.medium
    private let sfProDisplayRegular = FontFamily.SFProDisplay.regular
    
    private let sectionBackgroundColor = Asset.Colors.fbfbfc151515.swiftUIColor
    private let textColor = Asset.Colors._000000Ffffff.swiftUIColor
    private let secondaryTextColor = Asset.Colors._828796.swiftUIColor
    
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
                            .padding(.trailing, 5)
                            .padding(.bottom, 5)
                        
                        ZStack(alignment: .bottom) {
                            HStack {
                                VStack {
                                    Text("Удобства")
                                        .font(
                                            .custom(sfProDisplayMedium, size: 17)
                                        )
                                        .foregroundColor(textColor)
                                        .frame(width: 200, alignment: .leading)
                                    Text("Самое необходимое")
                                        .font(
                                            .custom(sfProDisplayRegular, size: 17)
                                        )
                                        .foregroundColor(secondaryTextColor)
                                        .frame(width: 200, alignment: .leading)
                                }
                                Spacer()
                                arrowImage
                            }
                            .padding(.bottom, 10)
                            
                            Divider()
                                .padding(.trailing, 10)
                        }
                    }
                }
                
                Button(action: {}) {
                    HStack {
                        tickSquareImage
                            .padding(.trailing, 5)
                            .padding(.bottom, 5)
                        
                        ZStack(alignment: .bottom) {
                            HStack {
                                VStack {
                                    Text("Что включено")
                                        .font(
                                            .custom(sfProDisplayMedium, size: 17)
                                        )
                                        .foregroundColor(textColor)
                                        .frame(width: 200, alignment: .leading)
                                    Text("Самое необходимое")
                                        .font(
                                            .custom(sfProDisplayRegular, size: 17)
                                        )
                                        .foregroundColor(secondaryTextColor)
                                        .frame(width: 200, alignment: .leading)
                                }
                                Spacer()
                                arrowImage
                            }
                            .padding(.bottom, 10)
                            
                            Divider()
                                .padding(.trailing, 10)
                        }
                    }
                }
                
                Button(action: {}) {
                    HStack {
                        closeSquareImage
                            .padding(.trailing, 5)
                        
                        Group {
                            VStack {
                                Text("Что не включено")
                                    .font(
                                        .custom(sfProDisplayMedium, size: 17)
                                    )
                                    .foregroundColor(textColor)
                                    .frame(width: 200, alignment: .leading)
                                Text("Самое необходимое")
                                    .font(
                                        .custom(sfProDisplayRegular, size: 17)
                                    )
                                    .foregroundColor(secondaryTextColor)
                                    .frame(width: 200, alignment: .leading)
                            }
                            Spacer()
                            arrowImage
                        }
                    }
                }
                
            }
            .padding(.all, 15)
            
        }
        .background(sectionBackgroundColor)
        .cornerRadius(15)
        .padding(.all, Constant.GeneralConstatnt.padding)
    }
}

// MARK: - Preview

struct AdditionalButtons_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalButtons()
    }
}
