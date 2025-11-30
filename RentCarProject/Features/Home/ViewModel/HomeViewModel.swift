//
//  HomeViewModel.swift
//  RentCarProject
//
//  Created by Nazar on 23.11.2025.
//

import FirebaseFirestore
import Combine

final class HomeViewModel: ObservableObject {
    @Published var featuredCars: [Car] = []
    @Published var recentCars: [Car] = []
    
    private let store: CarStore
    private var cancellables = Set<AnyCancellable>()
    
    private let featuredIds = ["Porsche911_White", "InfinitiQx80_Beige"]
    private let recentIds   = ["MercedesVclass_Black", "Porsche911_White"]
    
    var featuredSlotsCount: Int {
            featuredIds.count
        }
    
    var recentSlotsCount: Int {
            recentIds.count
        }
    
    init(store: CarStore = .shared) {
        self.store = store
        store.$allCars
            .receive(on: DispatchQueue.main)
            .sink { [weak self] all in
                guard let self else { return }
                
                self.featuredCars = self.pickCars(from: all, ids: self.featuredIds)
                self.recentCars   = self.pickCars(from: all, ids: self.recentIds)
            }
            .store(in: &cancellables)
    }
    
    private func pickCars(from all: [Car], ids: [String]) -> [Car] {
        let dict = Dictionary(uniqueKeysWithValues: all.map { ($0.id, $0) })
        
        return ids.compactMap { dict[$0] }
    }
    
    func reload() {
        store.refreshFromServer()
    }
    
    @MainActor
    func reloadAsync() async {
        await withCheckedContinuation { continuation in
            store.refreshFromServer {
                continuation.resume()
            }
        }
    }
}
