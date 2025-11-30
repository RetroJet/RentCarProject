//
//  CarDetailDescription.swift
//  RentCarProject
//
//  Created by Nazar on 14.11.2025.
//

import SwiftUI

struct CarDetailDescription: View {
    private let categories = ["Description", "Location", "Review"]
    
    @State private var selectedCategory = "Location"
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            HStack(spacing: 41) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundColor(selectedCategory == category ? .black : .gray)
                        .overlay(alignment: .bottom) {
                            if selectedCategory == category {
                                Rectangle()
                                    .frame(height: 3)
                                    .foregroundColor(.black)
                                    .matchedGeometryEffect(id: "underline", in: namespace)
                                    .offset(y: 13)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                selectedCategory = category
                            }
                        }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 17)
    }
}

#Preview {
    CarDetailDescription()
}
