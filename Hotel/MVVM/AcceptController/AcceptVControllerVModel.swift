//
//  AcceptVControllerVModel.swift
//  Hotel
//
//  Created by macbook on 22.12.2023.
//

import SwiftUI

@MainActor
final class AcceptVControllerVModel: ObservableObject {
    // MARK: - Attributes
    
    let title = "Ваш заказ принят в работу"
    let description = "Подтверждение заказа №\(RundomGenerator.rundomOrder()) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    
    let navigationTitle = "Заказ оплачен"
    let buttonTitle = "Супер!"
    
    private weak var appCoordinator: AppCoordinator?
    
    // MARK: - Init
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    // MARK: - Methods
    
    func transition() {
        appCoordinator?.pop()
    }
}
