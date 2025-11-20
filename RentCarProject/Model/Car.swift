//
//  Car.swift
//  RentCarProject
//
//  Created by Nazar on 20.11.2025.
//

import FirebaseFirestore

struct Car: Identifiable, Codable {
    @DocumentID var id: String?
    
    let brand: String
    let fuelConsumption: String
    let numberOfSeat: String
    let pricePerDay: String
    let gearBox: String
    let horsePower: String
    let drive: String
    let maxSpeed: String
    
    let image: String
    let detailImage: String?

    let imageWidthCar: Int
    let imageHeightCar: Int
    
    let imageWidthDetailCar: Int
    let imageHeightDetailCar: Int

    let category: CarCategory
    var favorite: Bool
}

enum CarCategory: String, Codable, CaseIterable {
    case all = "All"
    case sedan = "SEDAN"
    case suv = "SUV"
    case sports = "VAN"
    case convertible = "CONVERTIBLE"
}
