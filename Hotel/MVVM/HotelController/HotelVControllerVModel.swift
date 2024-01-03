//
//  HotelControllerVModel.swift
//  Hotel
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

@MainActor
final class HotelVControllerVModel: ObservableObject {
    // MARK: - Attributes
    
    @Published var model: Hotel?
    
    let title: String = "Отель"
    let buttonTitle: String = "К выбору номера"
    let aboutHotelTitle: String = "Об отеле"
    
    private let networkService = NetworkService()
    private weak var appCoordinator: AppCoordinator?
    
    // MARK: - Init
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
        fetchModel()
    }
    
    // MARK: - Methods
    
    private func fetchModel() {
        networkService.requestHotel { [weak self] result in
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
    @MainActor 
    func transition() {
        if let title = model?.name {
            appCoordinator?.push(.rooms(title: title), title: title)
        }
    }
}
