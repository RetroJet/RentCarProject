//
//  Car.swift
//  RentCarProject
//
//  Created by Nazar on 20.11.2025.
//

import FirebaseFirestore

struct Car: Identifiable, Codable {
    var id: String
    var brand: String
    var pricePerDay: String
    var fuelConsumption: String
    var numberOfSeat: String
    var maxSpeed: String
    var gearBox: String
    var horsePower: String
    var drive: String
    var category: CarCategory
    var ui: CarUI?
    var images: CarImages?
}

struct CarUI: Codable {
    var imageWidthCar: Double
    var imageHeightCar: Double
    var imageWidthDetailCar: Double
    var imageHeightDetailCar: Double
    var imageWidthCard: Double
    var imageHeightCard: Double
}

struct CarImages: Codable {
    var main: String
    var detail: String
}

enum CarCategory: String, Codable, CaseIterable {
    case all = "ALL"
    case sedan = "SEDAN"
    case suv = "SUV"
    case sports = "SPORTS"
    case convertible = "CONVERTIBLE"
    case van = "VAN"
}
