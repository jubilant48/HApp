//
//  NetworkService.swift
//  Hotel
//
//  Created by macbook on 16.12.2023.
//

import SwiftUI

final class NetworkService {
    // MARK: - Attributes
    
    private let service = RequestService()
    
    var hotelRequestTask: Task<Void, Never>? = nil
    var roomsRequestTask: Task<Void, Never>? = nil
    var bookingRequestTask: Task<Void, Never>? = nil
    var imageRequestTask: Task<Void, Never>? = nil
    
    // MARK: - Init
    
    deinit {
        hotelRequestTask?.cancel()
        roomsRequestTask?.cancel()
        bookingRequestTask?.cancel()
        imageRequestTask?.cancel()
    }
    
    // MARK: - Methods
    
    func requestHotel(completion: @escaping (Result<Hotel, Error>) -> Void) {
        let builder = QueryBuilder()
            .set(scheme: .https)
            .set(host: .mocky)
            .add(path: .v3)
            .add(path: .slash)
            .add(path: "d144777c-a67f-4e35-867a-cacc3b827473")
        
        hotelRequestTask = Task {
            do {
                let hotel = try await service.create(request: builder.create(), type: Hotel.self)
                completion(.success(hotel))
            } catch {
                completion(.failure(error))
            }
            
            hotelRequestTask = nil
        }
    }
    
    func requestRooms(completion: @escaping (Result<Rooms, Error>) -> Void) {
        let builder = QueryBuilder()
            .set(scheme: .https)
            .set(host: .mocky)
            .add(path: .v3)
            .add(path: .slash)
            .add(path: "8b532701-709e-4194-a41c-1a903af00195")
        
        roomsRequestTask = Task {
            do {
                let rooms = try await service.create(request: builder.create(), type: Rooms.self)
                completion(.success(rooms))
            } catch {
                completion(.failure(error))
            }
            
            roomsRequestTask = nil
        }
    }
    
    func requestBooking(completion: @escaping (Result<Booking, Error>) -> Void) {
        let builder = QueryBuilder()
            .set(scheme: .https)
            .set(host: .mocky)
            .add(path: .v3)
            .add(path: .slash)
            .add(path: "63866c74-d593-432c-af8e-f279d1a8d2ff")
        
        bookingRequestTask = Task {
            do {
                let booking = try await service.create(request: builder.create(), type: Booking.self)
                completion(.success(booking))
            } catch {
                completion(.failure(error))
            }
            
            bookingRequestTask = nil
        }
    }
    
    func requestImage(url: URL ,completion: @escaping (Result<UIImage, Error>) -> Void) {
        imageRequestTask = Task {
            do {
                let image = try await service.create(from: url)
                completion(.success(image))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
