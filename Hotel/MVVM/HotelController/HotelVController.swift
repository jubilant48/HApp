//
//  HotelController.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI
import SFSafeSymbols

struct HotelVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: HotelVControllerVModel
    
    var body: some View {
        CustomScrollView(title: viewModel.title) {
            
            if let hotel = viewModel.model {
                
                CustomSection {
                    VStack {
                        ImageSlider(imageUrls: hotel.imageUrls)
                            .frame(height: Constant.ImageSliderConstatnt.height)
                            .padding(.all,
                                     Constant.GeneralConstatnt.padding)
                        
                        MainInfoHotelView(name: hotel.name,
                                          adress: hotel.adress,
                                          rating: hotel.rating,
                                          ratingName: hotel.ratingName)
                        .padding(.all, Constant.GeneralConstatnt.padding)
                        
                        PriceView(from: hotel.minimalPrice,
                                  forIt: hotel.priceForIt)
                        .padding(.all,
                                 Constant.GeneralConstatnt.padding)
                    }
                }
                
                CustomSection {
                    VStack {
                        HStack {
                            Text("Об отеле")
                                .font(
                                    .custom(FontFamily.SFProDisplay.bold, size: 22)
                                )
                            
                            Spacer()
                        }
                        .padding([.top, .leading, .trailing],
                                 Constant.GeneralConstatnt.padding)
                        
                        TagsView(hotel.aboutTheHotel.peculiarities)
                            .padding([.leading, .trailing],
                                     10)
                        
                        Text(hotel.aboutTheHotel.description)
                            .font(
                                .custom(FontFamily.SFProDisplay.regular, size: 17)
                            )
                            .padding([.leading, .trailing],
                                     Constant.GeneralConstatnt.padding)
                            .padding(.top, 8)
                        
                        AdditionalButtons()
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(viewModel.buttonTitle) { viewModel.transition() }
                            .buttonStyle(RoundedButtonStyle())
                            .padding(.top, 12)
                    }
                }
                
            }
        }
    }
}

// MARK: - Preview

struct HotelVController_Previews: PreviewProvider {
    static var previews: some View {
        HotelVController(
            viewModel: HotelVControllerVModel(appCoordinator: MainVController_Previews.appCoordinator)
        )
    }
}
