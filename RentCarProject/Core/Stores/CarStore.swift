//
//  CarStore.swift
//  RentCarProject
//
//  Created by Nazar on 25.11.2025.
//

import SwiftUI
import Combine

final class CarStore: ObservableObject {
    static let shared = CarStore()
    
    @Published private(set) var allCars: [Car] = []
    
    private let service = FirebaseService()
    private let fileURL: URL
    
    private init() {
        let docs = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask).first!
        fileURL = docs.appendingPathComponent("cars.json")
        
        loadFromDisk()
        
        if allCars.isEmpty {
            loadFromBundle()
        }
        
        refreshFromServer()
    }
    
    
    // MARK: - Public API
    func cars(for category: CarCategory, search: String) -> [Car] {
        let filteredByCategory: [Car]
        
        if category == .all {
            filteredByCategory = allCars
        } else {
            filteredByCategory = allCars.filter { $0.category == category }
        }
        
        let trimmed = search.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return filteredByCategory }
        
        return filteredByCategory.filter { car in
            car.brand.lowercased().contains(trimmed.lowercased())
        }
    }
    
    func refreshFromServer(completion: (() -> Void)? = nil) {
        service.fetchCars { [weak self] cars in
            guard let self = self else {
                completion?()
                return
            }
            
            DispatchQueue.main.async {
                self.allCars = cars
                completion?()
            }
            
            DispatchQueue.global(qos: .background).async {
                self.saveToDisk(cars)
            }
        }
    }
    
    // MARK: - Loading
    private func loadFromDisk() {
        do {
            let data = try Data(contentsOf: fileURL)
            let decoded = try JSONDecoder().decode([Car].self, from: data)
            allCars = decoded
            print("Cars loaded from disk: \(decoded.count)")
        } catch {
            print("No local cars yet or decode error:", error)
        }
    }
    
    private func loadFromBundle() {
        guard
            let url = Bundle.main.url(forResource: "cars", withExtension: "json")
        else {
            print("No cars.json in bundle")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Car].self, from: data)
            allCars = decoded
            print("Cars loaded from bundle: \(decoded.count)")
            
            saveToDisk(decoded)
        } catch {
            print("Failed to load cars from bundle:", error)
        }
    }
    
    // MARK: - Saving
    private func saveToDisk(_ cars: [Car]) {
        do {
            let data = try JSONEncoder().encode(cars)
            try data.write(to: fileURL, options: .atomic)
            print("Cars saved to disk: \(cars.count)")
        } catch {
            print("Failed to save cars:", error)
        }
    }
}
