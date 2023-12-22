//
//  RoomsVControllerVModel.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

@MainActor
final class RoomsVControllerVModel: ObservableObject {
    // MARK: - Attributes
    
    @Published var model: Rooms?
    
    var title: String
    var buttonTitle: String = "Выбрать номер"
    
    private var networkService = NetworkService()
    private weak var appCoordinator: AppCoordinator?
    
    // MARK:  - Init
    
    init(title: String, appCoordinator: AppCoordinator) {
        self.title = title
        self.appCoordinator = appCoordinator
        fetchModel()
    }
    
    // MARK: - Methods
    
    private func fetchModel() {
        networkService.requestRooms { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.model = model
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func transition() {
        appCoordinator?.push(.booking)
    }
}
