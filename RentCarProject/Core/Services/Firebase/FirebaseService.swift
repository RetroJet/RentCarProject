//
//  FirebaseService.swift
//  RentCarProject
//
//  Created by Nazar on 22.11.2025.
//

import FirebaseFirestore

final class FirebaseService {
    private lazy var db = Firestore.firestore()

    private struct FirestoreCar: Codable {
        let brand: String
        let pricePerDay: String
        let fuelConsumption: String
        let numberOfSeat: String
        let maxSpeed: String
        let gearBox: String
        let horsePower: String
        let drive: String
        let category: CarCategory
        let ui: CarUI?
        let images: CarImages?
    }

    func fetchCars(completion: @escaping ([Car]) -> Void) {
        db.collection("cars").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                print("Error fetching cars: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }

            let cars: [Car] = documents.compactMap { doc in
                do {
                    let raw = try doc.data(as: FirestoreCar.self)

                    return Car(
                        id: doc.documentID,
                        brand: raw.brand,
                        pricePerDay: raw.pricePerDay,
                        fuelConsumption: raw.fuelConsumption,
                        numberOfSeat: raw.numberOfSeat,
                        maxSpeed: raw.maxSpeed,
                        gearBox: raw.gearBox,
                        horsePower: raw.horsePower,
                        drive: raw.drive,
                        category: raw.category,
                        ui: raw.ui,
                        images: raw.images
                    )

                } catch {
                    print("Failed to decode car:", error)
                    return nil
                }
            }

            DispatchQueue.main.async {
                completion(cars)
            }
        }
    }
}
