//
//  Untitled.swift
//  RentCarProject
//
//  Created by Nazar on 14.11.2025.
//

import SwiftUI
import Combine

class CarDetailsViewModel: ObservableObject {
    @Published var blocks: [CarDetailUIBlock] = []

    init(car: CarFilter) {
        self.blocks = CarDetailsViewModel.makeBlocks(for: car)
    }

    private static func makeBlocks(for car: CarFilter) -> [CarDetailUIBlock] {
        return [
            CarDetailUIBlock(iconName: "petrol", title: "Range", value: "\(car.fuelConsumption)km"),
            CarDetailUIBlock(iconName: "speedIcon", title: "Speed", value: "\(car.maxSpeed) km/h"),
            CarDetailUIBlock(iconName: "seat", title: "Capacity", value: car.numberOfSeat),
            CarDetailUIBlock(iconName: "gearBoxIcon", title: "Gear", value: car.gearBox),
            CarDetailUIBlock(iconName: "engineIcon", title: "Engine", value: "\(car.horsePower)Hp"),
            CarDetailUIBlock(iconName: "driveIcon", title: "Drive", value: car.drive)
        ]
    }
}
