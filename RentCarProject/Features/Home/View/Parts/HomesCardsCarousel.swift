//
//  HomesCardsCarousel.swift
//  RentCarProject
//
//  Created by Nazar on 28.11.2025.
//

import SwiftUI

struct HomesCardsCarousel: View {
    let cars: [Car]
    let placeholderCount: Int
    let isLoading: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                
                if isLoading || cars.isEmpty {
                    ForEach(0..<placeholderCount, id: \.self) { _ in
                        HomeSkeletonCard()
                    }
                } else {
                    ForEach(cars) { car in
                        NavigationLink {
                            CarDetailsView(viewModel: CarDetailsViewModel(car: car))
                        } label: {
                            HomeHorizontalCards(car: car)
                        }
                    }
                }
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    HomesCardsCarousel(
        cars: [],
        placeholderCount: 3,
        isLoading: true
    )
}
