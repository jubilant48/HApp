//
//  RoomCell.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

@MainActor
struct RoomCell: View {
    // MARK: - Attributes
    
    var imageUrls: [URL?]
    var title: String
    var tags: [String]
    var price: Int
    var pricePer: String
    var transition: () -> Void
    
    private let titleFont = FontFamily.SFProDisplay.bold
    private let arrowImage = Asset.Images.blueRightArrow.swiftUIImage
    private let detailButtonColor = Asset.Colors._0d72ff.swiftUIColor
    private let buttonTitle = "Выбрать номер"
    
    var body: some View {
        CustomSection {
            VStack {
                ImageSlider(imageUrls: imageUrls)
                    .frame(height: Constant.ImageSliderConstatnt.height)
                    .padding(.all,
                             Constant.GeneralConstatnt.padding)
                HStack {
                    Text(title)
                        .font(
                            .custom(titleFont, size: 22)
                        )
                        .padding([.leading, .trailing],
                                 Constant.GeneralConstatnt.padding)
                    Spacer()
                }
                
                TagsView(tags)
                    .padding([.leading, .trailing],
                             10)
                HStack {
                    Button(action: {}) {
                        HStack{
                            Text("Подробнее о номере")
                            arrowImage
                                .foregroundColor(detailButtonColor)
                                .padding(.leading, -8)
                        }
                        
                    }
                    .buttonStyle(TagButtonStyle(backgroundColor: detailButtonColor.opacity(0.1),
                                                foregroundColor: detailButtonColor))
                    Spacer()
                }
                .padding([.leading, .trailing], 14)
                
                PriceView(price, per: pricePer)
                    .padding(.all,
                             Constant.GeneralConstatnt.padding)
                
                Button(buttonTitle) {
                    transition()
                }
                .buttonStyle(RoundedButtonStyle())
                .padding([.leading, .trailing, .bottom],
                         Constant.GeneralConstatnt.padding)
            }
        }
    }
}

// MARK: - Preview

struct RoomCell_Previews: PreviewProvider {
    static var previews: some View {
        RoomCell(
            imageUrls: [
                URL(string: "https://www.atorus.ru/sites/default/files/upload/image/News/56871/риксос сигейт.jpg"),
                URL(string: "https://q.bstatic.com/xdata/images/hotel/max1024x768/267647265.jpg?k=c8233ff42c39f9bac99e703900a866dfbad8bcdd6740ba4e594659564e67f191&o="),
                URL(string: "https://worlds-trip.ru/wp-content/uploads/2022/10/white-hills-resort-5.jpeg")
            ],
            title: "Стандартный номер с видом на бассейн",
            tags: ["Все вклюено", "Кондиционер"],
            price: 186600,
            pricePer: "За 7 ночей с перелетом",
            transition: {}
        )
    }
}
