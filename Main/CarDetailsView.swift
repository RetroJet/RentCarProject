//
//  CarDetailsView.swift
//  RentCarProject
//
//  Created by Nazar on 13.11.2025.
//
    
import SwiftUI

struct CarDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: CarDetailsViewModel
    let car: CarFilter
    
    private let columns = [
        GridItem(.flexible(), spacing: 37),
        GridItem(.flexible(), spacing: 37),
        GridItem(.flexible())
    ]
    @State private var dragOffset: CGFloat = 0
   @State private var arrowOpacities: [Double] = [0.4, 0.7, 1.0]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack {
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Button {
                            dismiss()
                        } label: {
                            Image(.arrowBackIcon)
                                .resizable()
                                .frame(width: 8, height: 16)
                        }
                        
                        Spacer()
                        
                        Text(car.brand)
                            .font(type: Montserrat.medium, size: 16)
                        
                        Spacer()
                    }
                    .frame(maxWidth: 373, maxHeight: 20)
                    .padding(.horizontal, 30)
                    
                    VStack(alignment: .center) {
                        if let imageName = car.detailImage, !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    maxWidth: CGFloat(car.imageWidthDetailCar),
                                    maxHeight: CGFloat(car.imageHeightDetailCar),
                                )
                                .padding(.top, 65)
                                .padding(.horizontal, 10)
                        } else {
                            Rectangle()
                                .fill(.white)
                                .frame(width: 300, height: 200)
                                .padding(.top, 60)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Highlight")
                            .font(type: Poppins.medium, size: 14)
                            .padding(.top, 10)
                            .padding(.horizontal, 30)
                        
                        LazyVGrid(columns: columns, spacing: 35) {
                            ForEach(viewModel.blocks) { block in
                                DetailBlockView(block: block)
                                    .frame(height: 85)
                            }
                        }
                        .padding(.top, 19)
                        .padding(.horizontal, 32)
                    }
                    
                    VStack {
                        CarDetailDescription()
                        
                        Divider()
                            .frame(maxHeight: 2)
                            .padding(.top, 12)
                    }
                    .padding(.top, 22)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
            }
            
                    // Bottom "GO" bar
                    VStack {
                        GeometryReader { geo in
                            let safeWidth = geo.size.width - 20
                                let buttonWidth: CGFloat = 110
                                let dragZone = safeWidth - buttonWidth
                                let maxOffset = max(dragZone, 0)

                                let fadeStart: CGFloat = 0.7
                                let fadeProgress = min(dragOffset / (maxOffset * fadeStart), 1)
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(.customGradientBlue)
                                    .frame(height: 70)
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.customGradientBlue)
                            .frame(maxWidth: .infinity, maxHeight: 70)
                            .overlay(alignment: .leading) {
                                HStack {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 100)
                                            .fill(.customBez)
                                            .frame(width: 100, height: 60)
                                            .overlay {
                                                Text("GO")
                                                    .font(type: Montserrat.medium, size: 28)
                                                    .foregroundStyle(.customGradientBlue)
                                            }
                                            .offset(x: dragOffset)
                                            .gesture(
                                                DragGesture()
                                                    .onChanged { value in
                                                        let newOffset = min(max(0, value.translation.width), maxOffset)
                                                        dragOffset = newOffset
                                                    }
                                                    .onEnded { value in
                                                        if dragOffset >= maxOffset * 0.9 {
                                                            dismiss()
                                                        } else {
                                                            withAnimation(.spring()) {
                                                                dragOffset = 0
                                                            }
                                                        }
                                                    }
                                            )
                                    }
                                       
                                    Spacer()
                                        
                                        HStack {
                                            HStack(spacing: 6) {
                                                ForEach(0..<arrowOpacities.count, id: \.self) { index in
                                                    Image(.vectorIcon)
                                                        .resizable()
                                                        .frame(width: 10, height: 20)
                                                        .opacity(arrowOpacities[index])
                                                        .opacity(1 - fadeProgress)
                                                }
                                            }
                                            .onAppear { startArrowsAnimation() }
                                        }
                                        .frame(width: 43, height: 20)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 0) {
                                        Text("$\(car.pricePerDay)")
                                            .font(type: Montserrat.medium, size: 28)
                                        
                                        Text("/day")
                                            .font(type: Montserrat.regular, size: 20)
                                    }
                                    .padding(.trailing, 15)
                                    .foregroundStyle(.customBez)
                                    .opacity(1 - Double(dragOffset / maxOffset))
                                    .fixedSize()                 // ← ключ!
                                    .layoutPriority(999)         // ← не дает сжиматься НИКОГДА
                                }
                                   
                            }
                            .padding(.horizontal, 5)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .padding(10)
                        }
                        .frame(height: 70)
                }
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    private func startArrowsAnimation() {
        for i in 0..<arrowOpacities.count {
            withAnimation(
                .easeInOut(duration: 0.7)
                    .repeatForever(autoreverses: true)
                    .delay(Double(i) * 0.2)
            ) {
                arrowOpacities[i] = 0.2
            }
        }
    }
}

#Preview {
    CarDetailsView(
        viewModel: CarDetailsViewModel(car: CarFilter.carFilterData[0]),
        car: CarFilter.carFilterData[0]
    )
}
