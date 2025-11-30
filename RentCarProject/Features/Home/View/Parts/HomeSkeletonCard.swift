//
//  HomeSkeletonCard.swift
//  RentCarProject
//
//  Created by Nazar on 26.11.2025.
//

import SwiftUI

struct HomeSkeletonCard: View {
    @State private var animate = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .compositingGroup()
            .frame(width: 300, height: 158)
            .shadow(color: .shadowGray.opacity(0.7), radius: 5, x: 3, y: 3)
            .shadow(color: .shadowGray.opacity(0.1), radius: 5, x: -3, y: -3)
            .shadow(color: .shadowGray.opacity(0.2), radius: 5, x: 3, y: -3)
            .shadow(color: .shadowGray.opacity(0.2), radius: 5, x: -3, y: 3)
            .blur(radius: 0.6)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.customPageSliderGray)
                            .frame(width: 90, height: 14)
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color.customPageSliderGray)
                            .frame(width: 18, height: 18)
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 10)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.customPageSliderGray.opacity(0.9))
                            .frame(height: 90)
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 8)
                    
                    Spacer(minLength: 6)

                    HStack {
                        HStack(spacing: 14) {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.customPageSliderGray)
                                .frame(width: 40, height: 10)
                            
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.customPageSliderGray)
                                .frame(width: 40, height: 10)
                            
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.customPageSliderGray)
                                .frame(width: 30, height: 10)
                        }
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.customPageSliderGray)
                            .frame(width: 70, height: 16)
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
            }
            .redacted(reason: .placeholder)
            .opacity(animate ? 0.9 : 0.4)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: 0.8)
                    .repeatForever(autoreverses: true)
                ) {
                    animate = true
                }
            }
    }
}
