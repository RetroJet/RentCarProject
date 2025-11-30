//
//  СarDetailBlock.swift
//  RentCarProject
//
//  Created by Nazar on 14.11.2025.
//

import SwiftUI

struct СarDetailBlock: View {
    let block: CarDetailUIBlock
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .frame(maxWidth: 85, maxHeight: 83)
            .shadow(color: .shadowGray.opacity(1), radius: 7, x: 7, y: 7)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.bgGray, lineWidth: 0.5)
                    .opacity(0.1)
                    .blur(radius: 1)
                
                VStack {
                    VStack(spacing: 7) {
                        Image(block.iconName)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundStyle(.customGradientBlue)
                            .frame(width: 27, height: 25)
                        
                        Text(block.title)
                            .font(type: Montserrat.semiBold, size: 12)
                            .foregroundStyle(.customGradientBlue)
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, 5)
                    .frame(maxWidth: 75, minHeight: 50)
                    .clipped()
                    
                    Text(block.value)
                        .font(type: Montserrat.medium, size: 14)
                        .foregroundStyle(.customGradientBlue)
                        .padding(.bottom, 3)
                }
            }
    }
}

#Preview {
    СarDetailBlock(
            block: CarDetailUIBlock(
                iconName: "petrol",
                title: "Fuel",
                value: "Diesel"
            )
        )
}
