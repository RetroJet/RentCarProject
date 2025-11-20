//
//  RecentCar.swift
//  RentCarProject
//
//  Created by Nazar on 11.11.2025.
//

import Foundation

struct RecentCar: Identifiable, Hashable, Equatable {
    let id = UUID()
    let bgColor: String
    let brand: String
    let image: String
    let imageWidthSize: Int
    let imageHeightSize: Int
    let fuelConsumption: String
    let numberOfSeat: String
    let pricePerDay: String
    
    static var recentCarsData: [RecentCar] {
        [
            RecentCar(
                bgColor: "customWhiteCard",
                brand: "FERRARI 458GTB",
                image: "ferrariCard",
                imageWidthSize: 241,
                imageHeightSize: 110,
                fuelConsumption: "15",
                numberOfSeat: "2",
                pricePerDay: "2000"
            ),
            
            RecentCar(
                bgColor: "customWhiteCard",
                brand: "PORSCHE CARERA 911",
                image: "porsche911",
                imageWidthSize: 241,
                imageHeightSize: 110,
                fuelConsumption: "12.5",
                numberOfSeat: "2",
                pricePerDay: "1200"
            )
        ]
    }
}

