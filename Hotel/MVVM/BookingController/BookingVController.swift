//
//  BookingVController.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

// MARK: - Constant

extension BookingVController {
    struct Constant {
        let padding: CGFloat = GeneralConstatnt.padding
        let eightPointPadding: CGFloat = 8
        let twelfPointPadding: CGFloat = 12
        
        let fontBold = GeneralConstatnt.fontBold
        let fontBoldSize: CGFloat = 22
        let fontRegular = GeneralConstatnt.fontRegular
        let fontRegularSize: CGFloat = 14
        
        let grayColor = Asset.Colors._828796.swiftUIColor
        let blueColor = Asset.Colors._0d72ff.swiftUIColor
    }
}

struct BookingVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: BookingVControllerVModel
    
    private let constant = Constant()
    
    var body: some View {
        GeometryReader { geometry in
            if let booking = viewModel.model,
               let buttonTitle = viewModel.buttonTitle {
                
                CustomScrollView(title: viewModel.title) {
                    CustomSection {
                        MainInfoHotelView(name: booking.hotelName,
                                          adress: booking.hotelAdress,
                                          rating: booking.horating,
                                          ratingName: booking.ratingName)
                        .padding(.all, constant.padding)
                    }
                    
                    CustomSection {
                        LinesOfDataView(lines: viewModel.getBookingData()) { }
                            .padding(.all, constant.padding)
                    }
                    
                    CustomSection {
                        VStack(alignment: .leading) {
                            Text(viewModel.infoAboutPurchaserTitle)
                                .font(.custom(constant.fontBold, size: constant.fontBoldSize))
                                .multilineTextAlignment(.leading)
                            
                            FloatingTextField(title: .constant(viewModel.phoneNumberTitle),
                                              text: $viewModel.phoneNumber,
                                              isValid: $viewModel.isValidPhoneNumber,
                                              type: .phoneNumber)
                            .padding(.all, constant.padding)
                            
                            FloatingTextField(title: .constant(viewModel.emailTitle),
                                              text: $viewModel.email,
                                              isValid: $viewModel.isValidEmail, type: .email)
                            .padding(.all, constant.padding)
                            
                            Text(viewModel.descriptionTitle)
                                .font(.custom(constant.fontRegular, size: constant.fontRegularSize))
                                .foregroundColor(constant.grayColor)
                                .multilineTextAlignment(.leading)
                                .padding([.leading, .trailing, .bottom], constant.eightPointPadding)
                        }
                        .padding(.all, constant.padding)
                    }
                    
                    VStack {
                        ForEach($viewModel.tourists, id: \.self) { tourist in
                            CustomSection {
                                CollapsibaleView(title: "\((tourist.wrappedValue.index + 1).asOrdinalRus) \(viewModel.touristTitle)")
                                    .environmentObject(viewModel.tourists[tourist.wrappedValue.index])
                                    .padding(.all, constant.padding)
                            }
                        }
                        
                        CustomSection {
                            PlusTouristView()
                                .environmentObject(viewModel)
                                .padding(.all, constant.padding)
                        }
                    }
                    
                    CustomSection {
                        LinesOfDataView(lines: viewModel.getDataOfPrice(), aligment: .right) {
                            LinesOfDataViewMethods()
                                .lineOfData(line: viewModel.getLastLine(),
                                            lastColor: constant.blueColor,
                                            lastFont: constant.fontBold)
                        }
                        .padding(.all, constant.padding)
                    }
                    
                }
                .onTapGesture {
                    hideKeyboard()
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(buttonTitle) {
                            viewModel.transition()
                        }
                        .buttonStyle(RoundedButtonStyle())
                        .padding(.top, constant.twelfPointPadding)
                    }
                }
                
            } else {
                LoadView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
        } // - Geometry Reader
    }
}
