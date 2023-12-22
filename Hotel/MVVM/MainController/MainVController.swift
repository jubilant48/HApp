//
//  MainVController.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

struct MainVController: View {
    // MARK: - Attributes
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    private let accentColor = Asset.Colors._000000Ffffff.swiftUIColor
    
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
        .accentColor(accentColor)
    }
    
}

// MARK: - Preview

struct MainVController_Previews: PreviewProvider {
    @State static var appCoordinator = AppCoordinator()
    
    static var previews: some View {
        MainVController()
            .environmentObject(appCoordinator)
    }
}
