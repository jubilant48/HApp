//
//  BookingVController.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

struct BookingVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: BookingVControllerVModel
    
    private let fontBold = FontFamily.SFProDisplay.bold
    private let fontRegular = FontFamily.SFProDisplay.regular
    private let grayColor = Asset.Colors._828796.swiftUIColor
    private let blueColor = Asset.Colors._0d72ff.swiftUIColor
    
    var body: some View {
        if let booking = viewModel.model,
           let buttonTitle = viewModel.buttonTitle {
            
            CustomScrollView(title: viewModel.title) {
                CustomSection {
                    MainInfoHotelView(name: booking.hotelName,
                                      adress: booking.hotelAdress,
                                      rating: booking.horating,
                                      ratingName: booking.ratingName)
                    .padding(.all,
                             Constant.GeneralConstatnt.padding)
                }

                CustomSection {
                    LinesOfDataView(lines: viewModel.getBookingData()) { }
                    .padding(.all,
                             Constant.GeneralConstatnt.padding)
                }

                CustomSection {
                    VStack(alignment: .leading) {
                        Text("Информация о покупателе")
                            .font(.custom(fontBold, size: 22))
                            .multilineTextAlignment(.leading)
                        
                        FloatingTextField(title: .constant("Номер телефона"),
                                          text: $viewModel.phoneNumber,
                                          isValid: $viewModel.isValidPhoneNumber,
                                          type: .phoneNumber)
                        .padding(.all,
                                 Constant.GeneralConstatnt.padding)
                        
                        FloatingTextField(title: .constant("Почта"),
                                          text: $viewModel.email,
                                          isValid: $viewModel.isValidEmail, type: .email)
                        .padding(.all,
                                 Constant.GeneralConstatnt.padding)
                        
                        Text("Эти данные никому не передаються. После оплаты мы вышлем чек на указанный вами номер и почту")
                            .font(.custom(fontRegular, size: 14))
                            .foregroundColor(grayColor)
                            .multilineTextAlignment(.leading)
                            .padding([.leading, .trailing, .bottom],
                                     8)
                    }
                    .padding(.all,
                             Constant.GeneralConstatnt.padding)
                }
                
                VStack {
                    ForEach($viewModel.tourists, id: \.self) { tourist in
                        CustomSection {
                            CollapsibaleView(title: "\((tourist.wrappedValue.index + 1).asOrdinalRus) турист")
                                .environmentObject(viewModel.tourists[tourist.wrappedValue.index])
                                .padding(.all, Constant.GeneralConstatnt.padding)
                        }
                    }
                    
                    CustomSection {
                        PlusTouristView()
                            .environmentObject(viewModel)
                            .padding(.all, Constant.GeneralConstatnt.padding)
                    }
                }
                
                CustomSection {
                    
                    LinesOfDataView(lines: viewModel.getDataOfPrice(), aligment: .right) {
                        LinesOfDataViewMethods()
                            .lineOfData(line: viewModel.getLastLine(),
                                        lastColor: blueColor,
                                        lastFont: fontBold)
                    }
                    .padding(.all,
                             Constant.GeneralConstatnt.padding)
                    
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
                    .padding(.top, 12)
                }
            }
            
        }
    }
}

// MARK: - Preview

struct BookingVController_Previews: PreviewProvider {
    static var previews: some View {
        BookingVController(
            viewModel: BookingVControllerVModel(appCoordinator: MainVController_Previews.appCoordinator)
        )
    }
}
