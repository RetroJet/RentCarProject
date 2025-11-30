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
    
    private let columns = [
        GridItem(.flexible(), spacing: 37),
        GridItem(.flexible(), spacing: 37),
        GridItem(.flexible())
    ]
    @State private var dragOffset: CGFloat = 0
    @State private var arrowOpacities: [Double] = [0.4, 0.7, 1.0]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            mainContent
            slideButton
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

//MARK: -> Subviews
private extension CarDetailsView {
    var mainContent: some View {
        VStack(spacing: 0) {
            header
            imageSection
            highlightSection
            descriptionSection
            Spacer()
        }
    }
    
    var header: some View {
        HStack(alignment: .center) {
            Button {
                dismiss()
            } label: {
                Image(.arrowBackIcon)
                    .resizable()
                    .frame(width: 8, height: 16)
            }
            
            Spacer()
            
            Text(viewModel.car.brand)
                .font(type: Montserrat.medium, size: 16)
            
            Spacer()
        }
        .frame(maxWidth: 373, maxHeight: 20)
        .padding(.horizontal, 30)
    }
    
    var imageSection: some View {
        VStack(alignment: .center) {
            if let imageName = viewModel.car.images?.detail, !imageName.isEmpty {
                Image(viewModel.car.images?.detail ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        maxWidth: CGFloat(viewModel.car.ui?.imageWidthDetailCar ?? 0),
                        maxHeight: CGFloat(viewModel.car.ui?.imageHeightDetailCar ?? 0),
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
    }
    
    var highlightSection: some View {
        VStack(alignment: .leading) {
            Text("Highlight")
                .font(type: Poppins.medium, size: 14)
                .padding(.top, 10)
                .padding(.horizontal, 30)
            
            LazyVGrid(columns: columns, spacing: 35) {
                ForEach(viewModel.blocks) { block in
                    СarDetailBlock(block: block)
                        .frame(height: 85)
                }
            }
            .padding(.top, 19)
            .padding(.horizontal, 32)
        }
    }
    
    var descriptionSection: some View {
        VStack {
            CarDetailDescription()
            
            Divider()
                .frame(maxHeight: 2)
                .padding(.top, 12)
        }
        .padding(.top, 22)
        .padding(.horizontal, 20)
    }
    
    var slideButton: some View {
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
                                        .fill(.customBeige)
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
                                    Text("$\(viewModel.car.pricePerDay)")
                                        .font(type: Montserrat.medium, size: 28)
                                    
                                    Text("/day")
                                        .font(type: Montserrat.regular, size: 20)
                                }
                                .padding(.trailing, 15)
                                .foregroundStyle(.customBeige)
                                .opacity(1 - Double(dragOffset / maxOffset))
                                .fixedSize()
                                .layoutPriority(999)
                            }
                            
                        }
                        .padding(.horizontal, 5)
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding(10)
            }
            .frame(height: 70)
        }
    }
}

// MARK: -> Animations
private extension CarDetailsView {
    func startArrowsAnimation() {
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
    let mockCar = Car(
        id: "preview-car-1",
        brand: "Porsche CARRERA 911",
        pricePerDay: "1250",
        fuelConsumption: "12.5",
        numberOfSeat: "2",
        maxSpeed: "320",
        gearBox: "A",
        horsePower: "700",
        drive: "RWD",
        category: .sports,
        ui: CarUI(
            imageWidthCar: 280,
            imageHeightCar: 180,
            imageWidthDetailCar: 320,
            imageHeightDetailCar: 220,
            imageWidthCard: 180,
            imageHeightCard: 120
        ),
        images: CarImages(
            main: "porscheCarrera911White",
            detail: "porscheCarrera911WhiteDetail"
        )
    )
    
    let vm = CarDetailsViewModel(car: mockCar)
    CarDetailsView(viewModel: vm)
}
