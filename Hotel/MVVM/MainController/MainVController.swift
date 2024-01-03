//
//  MainVController.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

// MARK: - Constant

extension MainVController {
    struct Constant {
        let accentColor = Asset.Colors._000000Ffffff.swiftUIColor
    }
}

struct MainVController: View {
    // MARK: - Attributes
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    private let constant = Constant()
    
    var body: some View {
        NavigationView {
            
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.getController(.hotel)
                    .navigationDestination(for: AppCoordinator.Controller.self) { controller in
                        appCoordinator.getController(controller)
                            .toolbarRole(.editor)
                    }
            }
  
        }
        .accentColor(constant.accentColor)
    }
}
