//
// CategoriesSkeletonRow.swift
//  RentCarProject
//
//  Created by Nazar on 26.11.2025.
//

import SwiftUI

struct CategoriesSkeletonRow: View {
    @State private var animate = false
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(maxWidth: .infinity, minHeight: 199)
            .overlay {
                VStack(spacing: 12) {
                    HStack {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.customPageSliderGray)
                            .frame(width: 120, height: 20)
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color.customPageSliderGray)
                            .frame(width: 24, height: 24)
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.customPageSliderGray)
                        .frame(height: 120)
                        .padding(.horizontal, 20)
                    
                    HStack {
                        HStack(spacing: 16) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.customPageSliderGray)
                                .frame(width: 60, height: 16)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.customPageSliderGray)
                                .frame(width: 60, height: 16)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.customPageSliderGray)
                                .frame(width: 40, height: 16)
                        }
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.customPageSliderGray)
                            .frame(width: 80, height: 20)
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
            }
            .redacted(reason: .placeholder)
            .opacity(animate ? 1 : 0.5)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 0.8)
                    .repeatForever(autoreverses: true)
                ) {
                    animate = true
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
    }
}
