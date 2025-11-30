//
//  HomeBanner.swift
//  RentCarProject
//
//  Created by Nazar on 28.11.2025.
//

import SwiftUI
import Combine

struct HomeBanner: View {
    @State private var currentBanner = 0
    @State private var bannerTimer = Timer
        .publish(every: 7, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        VStack(spacing: 5) {
            cardTabView
            pageIndicators
        }
        .frame(minWidth: 373, minHeight: 209)
    }
}

private extension HomeBanner {
    var cardTabView: some View {
        TabView(selection: $currentBanner) {
            firstBanner
            secondBanner
        }
        .frame(height: 210)
        .padding(.top, 15)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onReceive(bannerTimer) { _ in
            withAnimation(.easeInOut(duration: 0.35)) {
                currentBanner = (currentBanner + 1) % 2
            }
        }
    }
    
    var firstBanner: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 10)
                .fill(.shadowGray)
                .frame(minWidth: 373, minHeight: 200)
                .overlay(alignment: .topTrailing) {
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.customGreen)
                        
                        Image(.logoMercedes)
                            .resizable()
                            .frame(width: 44, height: 43)
                            .padding(.top, 17)
                            .padding(.leading, 20)
                    }
                    .frame(width: 82, height: 125)
                    .padding([.top, .trailing], 14)
                }
            
                .overlay(alignment: .trailing) {
                    Image(.mercedesCard)
                        .resizable()
                        .frame(width: 220, height: 144)
                        .padding(.top, 55)
                }
            
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading) {
                        Text("Taste the Classy with our New")
                            .font(type: Poppins.medium, size: 11)
                            .foregroundStyle(.black)
                        Text("Mercedes Addition")
                            .font(type: Poppins.medium, size: 20)
                            .foregroundStyle(.black)
                    }
                    .multilineTextAlignment(.trailing)
                    .padding(.top, 11)
                    .padding(.leading, 12)
                }
            
                .overlay(alignment: .bottomLeading) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Extra offer for \nExclusive Members")
                            .font(type: Poppins.regular, size: 12)
                            .foregroundStyle(.customGreen)
                        
                        Button {
                            //
                        } label: {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 27)
                                    .strokeBorder(.customGray, lineWidth: 1)
                                    .frame(width: 112, height: 30)
                                Text("Check Now")
                                    .font(type: Poppins.medium, size: 14)
                                    .foregroundStyle(.customGray)
                            }
                        }
                    }
                    .padding(.bottom, 21)
                    .padding(.leading, 22)
                }
        }
        .padding(.horizontal, 10)
        .tag(0)
    }
    
    var secondBanner: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        colors: [.gradientGray, .gradientGray2],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(minWidth: 373, minHeight: 200)
                .overlay(alignment: .topTrailing) {
                    Image(.saleCard)
                        .resizable()
                        .frame(width: 101, height: 72)
                        .clipped()
                }
            
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading) {
                            Text("Experience the")
                                .font(type: PinyonScript.regular, size: 20)
                                .foregroundStyle(.black)
                            
                            Text("Rolls-Royce lifestyle")
                                .font(type: Poppins.medium, size: 20)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Additional")
                                .font(type: Poppins.light, size: 12)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.gradientOrange, .gradientYellow],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                            
                            Text("$1000off")
                                .font(type: Poppins.semiBold, size: 20)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.gradientOrange, .gradientYellow],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                    }
                    .padding(.top, 6)
                    .padding(.leading, 8)
                }
            
                .overlay() {
                    Image(.rollsRoyceGhost)
                        .resizable()
                        .frame(width: 380, height: 124)
                        .padding(.top, 76)
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 10)
        .tag(1)
    }
    
    var pageIndicators: some View {
        HStack {
            ForEach(0..<2, id: \.self) { index in
                Capsule()
                    .frame(width: currentBanner == index ? 15 : 10, height: 4)
                    .foregroundStyle(currentBanner == index ? .customPageSliderDarkGray : .customPageSliderGray)
                    .onTapGesture {
                        currentBanner = index
                    }
                    .animation(.easeInOut, value: currentBanner)
            }
        }
    }
}

#Preview {
    HomeBanner()
}
