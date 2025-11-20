//
//  InfoCardDetails.swift
//  RentCarProject
//
//  Created by Nazar on 14.11.2025.
//

import Foundation

enum CarDetailType {
    case range
    case gearBox
    case seats
    case maxSpeed
    case horsePower
    case drive
}

struct CarDetailBlock: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let type: CarDetailType
    
    static let template: [CarDetailBlock] = [
        CarDetailBlock(iconName: "petrol",      title: "Range",      type: .range),
        CarDetailBlock(iconName: "gearBoxIcon", title: "Gearbox",    type: .gearBox),
        CarDetailBlock(iconName: "seatIcon",        title: "Seats",      type: .seats),
        CarDetailBlock(iconName: "speedIcon",   title: "Max Speed",  type: .maxSpeed),
        CarDetailBlock(iconName: "engineIcon",    title: "Engine",       type: .horsePower),
        CarDetailBlock(iconName: "driveIcon",  title: "Drive",     type: .drive)
    ]
}
