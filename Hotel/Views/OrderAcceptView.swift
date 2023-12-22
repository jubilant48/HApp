//
//  OrderAcceptView.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

struct OrderAcceptView: View {
    var circleForegroundColor = Color(asset: Asset.Colors.f6f6f9424242)
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Text("🎉")
                .font(.custom("",
                              size: CGFloat(44)))
                .frame(width: 94, height: 94)
                .background(Circle()
                    .foregroundColor(circleForegroundColor))
                .padding(.bottom, 32)

            
            Text(title)
                .font(.custom(FontFamily.SFProDisplay.bold, size: 22))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            Text(description)
                .font(.custom(FontFamily.SFProDisplay.regular, size: 17))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.leading, 35)
                .padding(.trailing, 35)
                
        }
    }
}

// MARK: - Preview

struct OrderAcceptView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAcceptView(title: "Ваш заказ принят в работу",
                        description: "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
    }
}
