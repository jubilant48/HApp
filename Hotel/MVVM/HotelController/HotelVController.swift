//
//  HotelController.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI
import SFSafeSymbols

// MARK: - Constant

extension HotelVController {
    struct Constant {
        let imageSliderHeight: CGFloat = 257
        
        let eightPadding: CGFloat = 8
        let tenPadding: CGFloat = 10
        let twelfPadding: CGFloat = 12
        let padding: CGFloat = GeneralConstatnt.padding
        
        let fontRegular = GeneralConstatnt.fontRegular
        let fontRegularSize: CGFloat = 17
        let fontBold = GeneralConstatnt.fontBold
        let fontBoldSize: CGFloat = 22
    }
}

struct HotelVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: HotelVControllerVModel
    
    private let constant = Constant()
    
    var body: some View {
        GeometryReader { geometry in
            if let hotel = viewModel.model {
                
                CustomScrollView(title: viewModel.title) {
                    
                    CustomSection {
                        VStack {
                            ImageSlider(imageUrls: hotel.imageUrls)
                                .frame(height: constant.imageSliderHeight)
                                .padding(.all, constant.padding)
                            
                            MainInfoHotelView(name: hotel.name,
                                              adress: hotel.adress,
                                              rating: hotel.rating,
                                              ratingName: hotel.ratingName)
                            .padding([.leading, .trailing], constant.padding)
                            
                            PriceView(from: hotel.minimalPrice,
                                      forIt: hotel.priceForIt)
                            .padding(.all, constant.padding)
                        }
                    }
                    
                    CustomSection {
                        VStack {
                            
                            HStack {
                                Text(viewModel.aboutHotelTitle)
                                    .font(
                                        .custom(constant.fontBold, size: constant.fontBoldSize)
                                    )
                                
                                Spacer()
                            }
                            .padding([.top, .leading, .trailing], constant.padding)
                            
                            TagsView(hotel.aboutTheHotel.peculiarities)
                                .padding([.leading, .trailing], constant.tenPadding)
                            
                            Text(hotel.aboutTheHotel.description)
                                .font(
                                    .custom(constant.fontRegular, size: constant.fontRegularSize)
                                )
                                .padding([.leading, .trailing], constant.padding)
                                .padding(.top, constant.eightPadding)
                            
                            AdditionalButtons()
                            
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            Button(viewModel.buttonTitle) { viewModel.transition() }
                                .buttonStyle(RoundedButtonStyle())
                                .padding(.top, constant.twelfPadding)
                        }
                    }
                    
                } // - Custom Scroll View
                
            } else {
                LoadView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
        }
    }
}
