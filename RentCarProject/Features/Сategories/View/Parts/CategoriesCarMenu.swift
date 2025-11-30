//
//  CategoriesCarMenu.swift
//  RentCarProject
//
//  Created by Nazar on 28.11.2025.
//

import SwiftUI

struct CategoriesCarMenu: View {
    @Binding var selectedCategory: CarCategory
    @Namespace private var underlineNamespace
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 37) {
                    ForEach(CarCategory.allCases, id: \.self) { category in
                        Button {
                            withAnimation(.spring(response: 0.35,
                                                  dampingFraction: 0.85,
                                                  blendDuration: 0.2)) {
                                selectedCategory = category
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Text(category.rawValue)
                                    .font(type: Montserrat.medium, size: 16)
                                    .foregroundStyle(.black)
                                
                                ZStack {
                                    if selectedCategory == category {
                                        RoundedRectangle(cornerRadius: 999)
                                            .frame(height: 3)
                                            .matchedGeometryEffect(
                                                id: "underline",
                                                in: underlineNamespace
                                            )
                                        
                                    } else {
                                        Color.clear
                                            .frame(height: 3)
                                    }
                                }
                            }
                        }
                        .buttonStyle(.plain)
                        .id(category)
                    }
                }
                .padding(.horizontal, 4)
            }
            .onChange(of: selectedCategory) { _, newValue in
                withAnimation(.spring(response: 0.35,
                                      dampingFraction: 0.85,
                                      blendDuration: 0.2)) {
                    proxy.scrollTo(newValue, anchor: .center)
                }
            }
            .animation(.spring(response: 0.35,
                               dampingFraction: 0.85,
                               blendDuration: 0.2),
                       value: selectedCategory)
        }
    }
}

#Preview {
    CategoriesCarMenu(selectedCategory: .constant(.all))
}
