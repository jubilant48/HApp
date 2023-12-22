//
//  BookingVControllerVModel.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI
import Foundation

@MainActor
final class BookingVControllerVModel: ObservableObject {
    // MARK: - Attributes
    
    @Published var model: Booking?
    
    var title: String = "Бронирование"
    var buttonTitle: String? {
        if let booking = model {
            var title = "Оплатить "
            let price = Double(booking.tourPrice + booking.fuelCharge + booking.serviceCharge)
            title += "\(NumericFormatter.decimalFormat(Double(price), format: .ru)) ₽"
    
            return title
        } else {
            return nil
        }
    }
    
    @Published var phoneNumber: String = ""
    @Published var isValidPhoneNumber: Bool = true
    
    @Published var email: String = ""
    @Published var isValidEmail: Bool = true
    
    @Published var tourists = [ TouristModel(isExpensed: true, index: 0) ]
    
    private var lastIndex: Int = 0
    
    private var networkService = NetworkService()
    private weak var appCoordinator: AppCoordinator?
    private let validation: Validation = Validation()
    
    // MARK:  - Init
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
        fetchModel()
    }
    
    // MARK: - Methods
    
    private func fetchModel() {
        networkService.requestBooking { [weak self] result in
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
        isValidPhoneNumber = validation.isValidPhoneNumber(phoneNumber)
        isValidEmail = validation.isValidEmail(email)
        var isValidTourists: [Bool] = []
        
        tourists.forEach { tourist in
            tourist.isValidName = validation.isValidName(tourist.name)
            tourist.isValidSurname = validation.isValidSurname(tourist.surname)
            tourist.isValidBirthday = validation.isValidBirthday(tourist.birthday)
            tourist.isValidCitizenship = validation.isValidCitizenship(tourist.citizenship)
            tourist.isValidPassportNumber = validation.isValidPassportNumber(tourist.passportNumber)
            tourist.isValidPassportValidityPeriod = validation.isValidPassportValidityPeriod(tourist.passportValidityPeriod)
            
            if tourist.isValidName && tourist.isValidSurname && tourist.isValidBirthday &&
               tourist.isValidCitizenship && tourist.isValidPassportNumber && tourist.isValidPassportValidityPeriod {
                isValidTourists.append(true)
            } else {
                withAnimation {
                    tourist.isExpensed = true
                }
                isValidTourists.append(false)
            }
        }
        
        if isValidPhoneNumber && isValidEmail && !isValidTourists.contains(false) {
            appCoordinator?.push(.acceptOrder)
        }
    }
    
    func getBookingData() -> [LineOfData] {
        if let model = model {
            return [
                LineOfData(name: "Вылет из", data: model.departure),
                LineOfData(name: "Страна, город", data: model.arrivalCountry),
                LineOfData(name: "Даты", data: "\(model.tourDateStart) - \(model.tourDateStop)"),
                LineOfData(name: "Кол-во ночей", data: "\(model.numberOfNights) ночей"),
                LineOfData(name: "Отель", data: model.hotelName),
                LineOfData(name: "Номер", data: model.room),
                LineOfData(name: "Питание", data: model.nutrition)
            ]
        }
        
        return []
    }
    
    
    func getDataOfPrice() -> [LineOfData] {
        if let model = model {
            return [
                LineOfData(name: "Тур", data: "\(NumericFormatter.decimalFormat(Double(model.tourPrice), format: .ru)) ₽"),
                LineOfData(name: "Топливный сбор", data: "\(NumericFormatter.decimalFormat(Double(model.fuelCharge), format: .ru)) ₽"),
                LineOfData(name: "Сервисный сбор", data: "\(NumericFormatter.decimalFormat(Double(model.serviceCharge), format: .ru)) ₽")
            ]
        }
        
        return []
    }
    
    func getLastLine() -> LineOfData {
        if let model = model {
            let price = Double(model.tourPrice + model.fuelCharge + model.serviceCharge)
            return LineOfData(name: "К оплате", data: "\(NumericFormatter.decimalFormat(Double(price), format: .ru)) ₽")
        }
        
        return LineOfData(name: "", data: "")
    }
    
    func addTourist() {
        if tourists.count < 10 {
            tourists.append(TouristModel(isExpensed: false, index: lastIndex + 1))
            lastIndex += 1
        }
    }
}

