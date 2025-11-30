//
//  HomeHorizontalCards.swift
//  RentCarProject
//
//  Created by Nazar on 28.11.2025.
//

import SwiftUI

struct HomeHorizontalCards: View {
    let car: Car
    
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
            .overlay(alignment: .topLeading) {
                VStack {
                    HStack {
                        Text(car.brand)
                            .font(type: Montserrat.medium, size: 13)
                        Spacer()
                    }
                    .padding(.top, 4)
                    .padding(.horizontal, 8)
                    
                    ZStack(alignment: .top) {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 284, height: 129)
                        
                        Image(car.images?.detail ?? "")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(1.1)
                            .frame(
                                width: CGFloat(car.ui?.imageWidthCard ?? 0),
                                height: CGFloat(car.ui?.imageHeightCard ?? 0)
                            )
                            .position(x: 140, y: 45)
                    }
                    .overlay(alignment: .bottom) {
                        HStack {
                            HStack(spacing: 18) {
                                HStack(spacing: 4) {
                                    Image(.petrol)
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Text("\(car.fuelConsumption)")
                                        .font(type: Montserrat.regular, size: 14)
                                }
                                
                                HStack(spacing: 3) {
                                    Image(.seat)
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                    Text("\(car.numberOfSeat)")
                                        .font(type: Montserrat.regular, size: 14)
                                }
                            }
                            .padding(.leading, 4)
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                Text("$\(car.pricePerDay)/")
                                    .font(type: Inter.medium, size: 16)
                                Text("day")
                                    .font(type: Inter.regular, size: 13)
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom, 10)
                }
            }
            .foregroundStyle(.black)
    }
}

#Preview {
    EmptyView()
}
