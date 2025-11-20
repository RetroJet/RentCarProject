//
//  FeaturedCar.swift
//  RentCarProject
//
//  Created by Nazar on 08.11.2025.
//

import Foundation

struct FeaturedCar: Identifiable, Hashable, Equatable {
    let id = UUID()
    let bgColor: String
    let brand: String
    let image: String
    let imageWidthSize: Int
    let imageHeightSize: Int
    let fuelConsumption: String
    let numberOfSeat: String
    let pricePerDay: String
    
    static var featuredCarsData: [FeaturedCar] {
        [
            FeaturedCar(
                bgColor: "customWhiteCard",
                brand: "PORSCHE CARERA 911",
                image: "porsche911",
                imageWidthSize: 241,
                imageHeightSize: 110,
                fuelConsumption: "12.5",
                numberOfSeat: "2",
                pricePerDay: "1200",
            ),
            
            FeaturedCar(
                bgColor: "cardBlue",
                brand: "DODGE X24",
                image: "dodgeX24",
                imageWidthSize: 200,
                imageHeightSize: 110,
                fuelConsumption: "12.5",
                numberOfSeat: "7",
                pricePerDay: "1150"
            )
        ]
    }
}
