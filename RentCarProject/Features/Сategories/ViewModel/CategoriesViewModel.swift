//
//  CategoriesViewModel.swift
//  RentCarProject
//
//  Created by Nazar on 20.11.2025.
//

import SwiftUI
import Combine

class CategoriesViewModel: ObservableObject {
    @Published var selectedCategory: CarCategory = .all
    @Published var searchText: String = ""
    @Published private(set) var allCars: [Car] = []
    @Published var isLoading: Bool = false
    
    private let store: CarStore
    private var cancellables = Set<AnyCancellable>()
    
    let categories: [CarCategory] = CarCategory.allCases
    
    init(store: CarStore = .shared) {
        self.store = store
        
        if allCars.isEmpty {
            isLoading = true
        }
        
        store.$allCars
            .receive(on: DispatchQueue.main)
            .sink { [weak self] cars in
                guard let self else { return }
                self.allCars = cars
                
                if !cars.isEmpty {
                    self.isLoading = false
                }
            }
            .store(in: &cancellables)
    }
    
    func cars(for category: CarCategory) -> [Car] {
        let base: [Car]
        
        if category == .all {
            base = allCars
        } else {
            base = allCars.filter { $0.category == category }
        }
        
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return base }
        
        return base.filter { car in
            car.brand.lowercased().contains(trimmed.lowercased())
        }
    }
    
    var filteredCars: [Car] {
        cars(for: selectedCategory)
    }
    
    func reload() {
        isLoading = true
        store.refreshFromServer { [weak self] in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
        }
    }
    
    @MainActor
    func reloadAsync() async {
        isLoading = true
        
        await withCheckedContinuation { continuation in
            store.refreshFromServer {
                continuation.resume()
            }
        }
        
        isLoading = false
    }
}
