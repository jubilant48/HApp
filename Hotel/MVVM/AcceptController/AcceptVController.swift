//
//  AcceptVController.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

// MARK: - Constant

extension AcceptVController {
    struct Constant {
        let cornerRadius: CGFloat = 15
        let twelfPointPadding: CGFloat = 12
        
        let backgroundColor = Asset.Colors.ffffff000000.color
    }
}

struct AcceptVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: AcceptVControllerVModel
    
    private let constant = Constant()
        
    var body: some View {
        OrderAcceptView(title: viewModel.title,
                        description: viewModel.description)
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color(uiColor: constant.backgroundColor), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .cornerRadius(constant.cornerRadius)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(viewModel.navigationTitle) { viewModel.transition() }
                    .buttonStyle(RoundedButtonStyle())
                    .padding(.top, constant.twelfPointPadding)
            }
        }
        .onAppear {
            UIToolbar.appearance().backgroundColor = constant.backgroundColor
        }
    }
}
