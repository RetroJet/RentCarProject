//
//  HomeView.swift
//  RentCarProject
//
//  Created by Nazar on 31.10.2025.
//

import SwiftUI
import Combine

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    let scrollToTopToken: Int
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                HomeHeader()
                
                ScrollViewReader { proxy in
                    ScrollView(showsIndicators: false) {
                        
                        Color.clear
                            .frame(height: 0.1)
                            .id("HOME-TOP")
                        
                        bannerSection
                        mapSection
                        brandSection
                        featuredSection
                        recentSection
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 100)
                    .onChange(of: scrollToTopToken) { _, _ in
                        let topId = "HOME-TOP"
                        withAnimation(.spring(response: 0.4,
                                              dampingFraction: 0.85,
                                              blendDuration: 0.2)) {
                            proxy.scrollTo(topId, anchor: .top)
                        }
                    }
                    .refreshable {
                        await viewModel.reloadAsync()
                    }
                }
            }
            
            topOverlayBar
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .overlay(Color.white.ignoresSafeArea(edges: .top))
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: -> Subviews
private extension HomeView {
    var bannerSection: some View {
        VStack(spacing: 5) {
            HomeBanner()
        }
        .frame(minWidth: 373, minHeight: 209)
    }
    
    var mapSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("Track from Map")
                    .font(type: Poppins.medium, size: 14)
            }
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(minWidth: 373, minHeight: 112)
                    .overlay {
                        Image(.geoMap)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: 80)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(.top, 5)
        .padding(.horizontal, 10)
    }
    
    var brandSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Choose By brand")
                    .font(type: Poppins.medium, size: 14)
                    .foregroundStyle(.textBlue)
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("View all")
                        .font(type: Poppins.medium, size: 12)
                        .foregroundStyle(.customBlueButton)
                }
                .padding(.trailing, 6)
            }
            .frame(minWidth: 373)
            .padding(.trailing, 7)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(CarModel.carModelData) { model in
                        Button {
                            //
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.white)
                                    .frame(width: 55, height: 55)
                                    .shadow(color: .shadowGray.opacity(0.7), radius: 2, x: 3, y: 3)
                                    .shadow(color: .shadowGray.opacity(0.1), radius: 2, x: -3, y: -3)
                                    .shadow(color: .shadowGray.opacity(0.2), radius: 2, x: 3, y: -3)
                                    .shadow(color: .shadowGray.opacity(0.2), radius: 2, x: -3, y: 3)
                                    .blur(radius: 0.6)
                                
                                
                                Image(model.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding(5)
                                    .clipped()
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .frame(height: 66)
                .padding(.horizontal, 4)
            }
        }
        .padding(.top, 17)
        .padding(.horizontal, 10)
    }
    
    var featuredSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack() {
                Text("Featured Cars")
                    .font(type: Poppins.medium, size: 14)
                    .foregroundStyle(.black)
                Spacer()
            }
            
            HomesCardsCarousel(
                cars: viewModel.featuredCars,
                placeholderCount: viewModel.featuredSlotsCount,
                isLoading: viewModel.featuredCars.isEmpty
            )
        }
        .padding(.top, 15)
        .padding(.horizontal, 10)
    }
    
    var recentSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack() {
                Text("Your Recent rentals")
                    .font(type: Poppins.medium, size: 14)
                    .foregroundStyle(.black)
                Spacer()
            }
            
            HomesCardsCarousel(
                cars: viewModel.recentCars,
                placeholderCount: viewModel.recentSlotsCount,
                isLoading: viewModel.featuredCars.isEmpty
            )
        }
        .padding(.top, 15)
        .padding(.horizontal, 10)
    }
    
    var topOverlayBar: some View {
        Rectangle()
            .fill(Color.white)
            .frame(height: 0)
    }
}

#Preview {
    HomeView(scrollToTopToken: 0)
}

