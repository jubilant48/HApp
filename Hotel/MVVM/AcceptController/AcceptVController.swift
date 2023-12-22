//
//  AcceptVController.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

struct AcceptVController: View {
    // MARK: - Attributes
    
    @StateObject var viewModel: AcceptVControllerVModel
    
    private let white = Color.white
    
    private let backgroundColor = Asset.Colors.ffffff000000.color
    
    var body: some View {
        OrderAcceptView(title: viewModel.title,
                        description: viewModel.description)
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color(uiColor: backgroundColor), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .cornerRadius(15)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(viewModel.navigationTitle) { viewModel.transition() }
                    .buttonStyle(RoundedButtonStyle())
                    .padding(.top, 12)
            }
        }
        .onAppear {
            UIToolbar.appearance().backgroundColor = backgroundColor
        }
    }
}

// MARK: - Preview

struct AcceptVController_Previews: PreviewProvider {
    static var previews: some View {
        AcceptVController(viewModel: AcceptVControllerVModel(appCoordinator: MainVController_Previews.appCoordinator))
    }
}
