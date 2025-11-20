////
////  CarFilter.swift
////  RentCarProject
////
////  Created by Nazar on 12.11.2025.
////
//
//import Foundation
//
//enum CarCategory: String, CaseIterable {
//    case all = "ALL"
//    case sedan = "SEDAN"
//    case suv = "SUV"
//    case sports = "SPORTS"
//    case van = "VAN"
//    case convertible = "CONVERTIBLE"
//}
//
//struct CarFilter: Identifiable, Hashable {
//    let id = UUID()
//    let brand: String
//    let fuelConsumption: String
//    let numberOfSeat: String
//    let pricePerDay: String
//    let gearBox: String
//    let horsePower: String
//    let drive: String
//    let maxSpeed: String
//    
//    let image: String
//    let detailImage: String?
//
//    let imageWidthCar: Int
//    let imageHeightCar: Int
//    
//    let imageWidthDetailCar: Int
//    let imageHeightDetailCar: Int
//
//    var favorite: Bool
//    
//    let category: CarCategory
//    
//    static var carFilterData: [CarFilter] {
//        [
//            CarFilter(
//                brand: "INFINITI QX80",
//                fuelConsumption: "12.5",
//                numberOfSeat: "7",
//                pricePerDay: "1200",
//                gearBox: "A",
//                horsePower: "330",
//                drive: "4WD",
//                maxSpeed: "280",
//                image: "infinitiCar",
//                detailImage: "infinitiQX80Details",
//                imageWidthCar: 300,
//                imageHeightCar: 127,
//                imageWidthDetailCar: 370,
//                imageHeightDetailCar: 200,
//                favorite: false,
//                category: .suv
//            ),
//            
//            CarFilter(
//                brand: "RANGE ROVER VELAR",
//                fuelConsumption: "10",
//                numberOfSeat: "7",
//                pricePerDay: "1500",
//                gearBox: "A",
//                horsePower: "320",
//                drive: "4WD",
//                maxSpeed: "280",
//                image: "rangeRoverCar",
//                detailImage: "rangeRoverVelarDetails",
//                imageWidthCar: 300,
//                imageHeightCar: 127,
//                imageWidthDetailCar: 370,
//                imageHeightDetailCar: 200,
//                favorite: false,
//                category: .suv
//            ),
//            
//            CarFilter(
//                brand: "MERCEDES G-WAGON",
//                fuelConsumption: "12.5",
//                numberOfSeat: "5",
//                pricePerDay: "1300",
//                gearBox: "A",
//                horsePower: "330",
//                drive: "4WD",
//                maxSpeed: "280",
//                image: "gWagonCarBlack",
//                detailImage: "gWagonBlackDetails",
//                imageWidthCar: 300,
//                imageHeightCar: 127,
//                imageWidthDetailCar: 350,
//                imageHeightDetailCar: 190,
//                favorite: false,
//                category: .suv
//            ),
//            
//            CarFilter(
//                brand: "MERCEDES G-WAGON",
//                fuelConsumption: "12.5",
//                numberOfSeat: "5",
//                pricePerDay: "1250",
//                gearBox: "A",
//                horsePower: "330",
//                drive: "4WD",
//                maxSpeed: "280",
//                image: "gWagonCarYellow",
//                detailImage: "gWagonYellowDetails",
//                imageWidthCar: 300,
//                imageHeightCar: 127,
//                imageWidthDetailCar: 340,
//                imageHeightDetailCar: 210,
//                favorite: false,
//                category: .suv
//            ),
//            
//            CarFilter(
//                brand: "PORSCHE CARERA 911",
//                fuelConsumption: "12.5",
//                numberOfSeat: "2",
//                pricePerDay: "1200",
//                gearBox: "A",
//                horsePower: "750",
//                drive: "AWD",
//                maxSpeed: "280",
//                image: "porsche911Car",
//                detailImage: "porsche911Details",
//                imageWidthCar: 290,
//                imageHeightCar: 148,
//                imageWidthDetailCar: 370,
//                imageHeightDetailCar: 200,
//                favorite: false,
//                category: .sports
//            ),
//            
//            CarFilter(
//                brand: "MERCEDES V-CLASS",
//                fuelConsumption: "7.5",
//                numberOfSeat: "8",
//                pricePerDay: "1000",
//                gearBox: "A",
//                horsePower: "220",
//                drive: "2WD",
//                maxSpeed: "280",
//                image: "vclassCar",
//                detailImage: "vclassDetails",
//                imageWidthCar: 300,
//                imageHeightCar: 124,
//                imageWidthDetailCar: 350,
//                imageHeightDetailCar: 170,
//                favorite: false,
//                category: .van
//            )
//        ]
//    }
//}
