//
//  СarCategoryMenu.swift
//  RentCarProject
//
//  Created by Nazar on 12.11.2025.
//

import SwiftUI

struct CarCategoryMenu: View {
    @Binding var selectedCategory: CarCategory
    @Namespace private var scrollNamespace
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 37) {
                    ForEach(CarCategory.allCases, id: \.self) { category in
                        VStack(spacing: 4) {
                            Text(category.rawValue)
                                .font(type: Montserrat.medium, size: 16)
                                .foregroundStyle(.black)
                            
                            if selectedCategory == category {
                                Rectangle()
                                    .frame(height: 3)
                                    .foregroundColor(.black)
                                    .matchedGeometryEffect(id: "underline", in: scrollNamespace)
                            } else {
                                Rectangle()
                                    .frame(height: 3)
                                    .foregroundColor(.clear)
                            }
                        }
                        .id(category)
                        .onTapGesture {
                            // Сначала скролл
                            withAnimation(.easeInOut(duration: 0.2)) {
                                proxy.scrollTo(category, anchor: .trailing)
                            }
                            
                            // Потом смена selectedCategory с небольшой задержкой
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 2)) {
                                    selectedCategory = category
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CarCategoryMenu(selectedCategory: .constant(.all))
}
