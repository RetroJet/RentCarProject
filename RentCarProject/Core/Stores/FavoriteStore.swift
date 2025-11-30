//
//  FavoriteStore.swift
//  RentCarProject
//
//  Created by Nazar on 25.11.2025.
//

import SwiftUI
import Combine

final class FavoriteStore: ObservableObject {
    @Published private(set) var favoriteIds: Set<String> = []
    
    init() {
        load()
    }
    
    func isFavorite(_ car: Car) -> Bool {
        favoriteIds.contains(car.id)
    }
    
    func toggle(_ car: Car) {
        if favoriteIds.contains(car.id) {
            favoriteIds.remove(car.id)
        } else {
            favoriteIds.insert(car.id)
        }
        save()
    }
    
    private func load() {
        let ids = UserDefaults.standard.array(forKey: "favoriteCarIds") as? [String] ?? []
        favoriteIds = Set(ids)
    }
    
    private func save() {
        UserDefaults.standard.set(Array(favoriteIds), forKey: "favoriteCarIds")
    }
}
