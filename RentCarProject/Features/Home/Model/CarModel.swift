//
//  CarModel.swift
//  RentCarProject
//
//  Created by Nazar on 02.11.2025.
//

import Foundation

struct CarModel: Identifiable, Hashable {
    let id = UUID()
    let image: String
    
    static var carModelData: [CarModel] {
        [
            CarModel(image: "ferrariLogo"),
            CarModel(image: "mercedesLogo"),
            CarModel(image: "bmwLogo"),
            CarModel(image: "rangeRoverLogo"),
            CarModel(image: "volvoLogo"),
            CarModel(image: "teslaLogo"),
            CarModel(image: "porscheLogo"),
            CarModel(image: "nissanLogo"),
            CarModel(image: "lexusLogo"),
            CarModel(image: "miniLogo"),
            CarModel(image: "skodaLogo"),
            CarModel(image: "astonMartinLogo"),
            CarModel(image: "cadillacLogo")
        ]
    }
}
