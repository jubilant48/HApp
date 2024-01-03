//
//  RoomCell.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

// MARK: - Constant

extension RoomCell {
    struct Constant {
        let minusEightPadding: CGFloat = -8
        let padding = GeneralConstatnt.padding
        let tenPadding: CGFloat = 10
        let fourteenPadding: CGFloat = 14
        
        let imageSiliderHeight: CGFloat = 257
        
        let titleFont = GeneralConstatnt.fontBold
        let titleFontSize: CGFloat = 22
        
        let buttonTitle = "Выбрать номер"
        let moreDetailsAboutRoomTitle = "Подробнее о номере"
        
        let detailButtonColor = Asset.Colors._0d72ff.swiftUIColor
        let opacity: CGFloat = 0.1
    }
}

@MainActor
struct RoomCell: View {
    // MARK: - Attributes
    
    var imageUrls: [URL?]
    var title: String
    var tags: [String]
    var price: Int
    var pricePer: String
    var transition: () -> Void
    
    private let constant = Constant()
    
    private let arrowImage = Asset.Images.blueRightArrow.swiftUIImage
    
    var body: some View {
        CustomSection {
            VStack {
                ImageSlider(imageUrls: imageUrls)
                    .frame(height: constant.imageSiliderHeight)
                    .padding(.all, constant.padding)
                
                HStack {
                    Text(title)
                        .font(
                            .custom(constant.titleFont, size: constant.titleFontSize)
                        )
                        .padding([.leading, .trailing], constant.padding)
                    
                    Spacer()
                }
                
                TagsView(tags)
                    .padding([.leading, .trailing], constant.tenPadding)
                
                HStack {
                    Button(action: {}) {
                        HStack{
                            Text(constant.moreDetailsAboutRoomTitle)
                            
                            arrowImage
                                .foregroundColor(constant.detailButtonColor)
                                .padding(.leading, constant.minusEightPadding)
                        }
                        
                    }
                    .buttonStyle(TagButtonStyle(backgroundColor: constant.detailButtonColor.opacity(constant.opacity),
                                                foregroundColor: constant.detailButtonColor))
                    Spacer()
                }
                .padding([.leading, .trailing], constant.fourteenPadding)
                
                PriceView(price, per: pricePer)
                    .padding(.all, constant.padding)
                
                Button(constant.buttonTitle) {
                    transition()
                }
                .buttonStyle(RoundedButtonStyle())
                .padding([.leading, .trailing, .bottom], constant.padding)
                
            }
        }
    }
}
