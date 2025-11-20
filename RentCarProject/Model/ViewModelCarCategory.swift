//
//  Untitled.swift
//  RentCarProject
//
//  Created by Nazar on 20.11.2025.
//

import SwiftUI
import Combine

class CategoriesViewModel: ObservableObject {
    @Published var allCars: [CarFilter] = CarFilter.carFilterData
    @Published var selectedCategory: CarCategory = .all
    @Published var searchText: String = ""

    var filteredCars: [CarFilter] {
        let categoryFiltered = selectedCategory == .all
            ? allCars
            : allCars.filter { $0.category == selectedCategory }
        
        guard !searchText.isEmpty else { return categoryFiltered }

        return categoryFiltered.filter { car in
            car.brand.lowercased().contains(searchText.lowercased())
        }
    }
}
