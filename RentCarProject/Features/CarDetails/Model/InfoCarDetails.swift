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

struct InfoCarDetails: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let type: CarDetailType
    
    static let template: [InfoCarDetails] = [
        InfoCarDetails(iconName: "petrol",      title: "Range",      type: .range),
        InfoCarDetails(iconName: "gearBoxIcon", title: "Gearbox",    type: .gearBox),
        InfoCarDetails(iconName: "seatIcon",        title: "Seats",      type: .seats),
        InfoCarDetails(iconName: "speedIcon",   title: "Max Speed",  type: .maxSpeed),
        InfoCarDetails(iconName: "engineIcon",    title: "Engine",       type: .horsePower),
        InfoCarDetails(iconName: "driveIcon",  title: "Drive",     type: .drive)
    ]
}
