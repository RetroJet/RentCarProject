//
//  СategoriesView.swift
//  RentCarProject
//
//  Created by Nazar on 11.11.2025.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel = CategoriesViewModel()
    @EnvironmentObject var favorites: FavoriteStore
    
    let scrollToTopToken: Int
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                VStack {
                    CategoriesHeader(
                        searchText: $viewModel.searchText,
                        selectedCategory: $viewModel.selectedCategory
                    )
                    
                    ScrollViewReader { proxy in
                        tabViewSection
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            .onChange(of: scrollToTopToken) { _, _ in
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    viewModel.selectedCategory = .all
                                }
                                
                                DispatchQueue.main.async {
                                    let topId = "TOP-\(viewModel.selectedCategory.rawValue)"
                                    withAnimation(.spring(response: 0.4,
                                                          dampingFraction: 0.85,
                                                          blendDuration: 0.2)) {
                                        proxy.scrollTo(topId, anchor: .top)
                                    }
                                }
                            }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

//MARK: -> Subviews
private extension CategoriesView {
    var tabViewSection: some View {
        TabView(selection: $viewModel.selectedCategory) {
            carList
        }
        
    }
    
    var carList: some View {
        ForEach(CarCategory.allCases, id: \.self) { category in
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    
                    Color.clear
                        .frame(height: 0)
                        .id("TOP-\(category.rawValue)")
                    
                    if viewModel.isLoading && viewModel.cars(for: category).isEmpty {
                        ForEach(0..<4, id: \.self) { _ in
                            CategoriesSkeletonRow()
                            Divider()
                                .frame(maxWidth: .infinity, maxHeight: 2)
                                .background(Color.black.opacity(0.1))
                        }
                    } else {
                        ForEach(viewModel.cars(for: category)) { car in
                            Rectangle()
                                .fill(.white)
                                .frame(maxWidth: .infinity, minHeight: 199)
                                .overlay(alignment: .topLeading) {
                                    VStack {
                                        // заголовок + избранное
                                        HStack {
                                            Text(car.brand)
                                                .font(type: Montserrat.medium, size: 16)
                                            Spacer()
                                            
                                            Button {
                                                favorites.toggle(car)
                                            } label: {
                                                Image(.heartFilterIcon)
                                                    .renderingMode(.template)
                                                    .resizable()
                                                    .frame(width: 20, height: 18)
                                                    .foregroundStyle(favorites.isFavorite(car) ? .customBlueButton : .bgGray)
                                            }
                                        }
                                        .padding(.top, 5)
                                        .padding(.horizontal, 10)
                                        
                                        ZStack(alignment: .top) {
                                            Rectangle()
                                                .fill(Color.clear)
                                                .frame(maxWidth: .infinity, minHeight: 151)
                                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                                            
                                            NavigationLink {
                                                CarDetailsView(viewModel: CarDetailsViewModel(car: car))
                                            } label: {
                                                Image(car.images?.main ?? "")
                                                    .resizable()
                                                    .frame(
                                                        width: CGFloat(car.ui?.imageWidthCar ?? 0),
                                                        height: CGFloat(car.ui?.imageHeightCar ?? 0)
                                                    )
                                                    .padding(.horizontal, 26)
                                            }
                                            .buttonStyle(.plain)
                                        }
                                        
                                        .overlay(alignment: .bottom) {
                                            HStack {
                                                HStack(spacing: 18) {
                                                    HStack(spacing: 4) {
                                                        Image(.petrol)
                                                            .resizable()
                                                            .frame(width: 15, height: 15)
                                                        Text("\(car.fuelConsumption)")
                                                            .font(type: Montserrat.regular, size: 18)
                                                    }
                                                    
                                                    HStack {
                                                        Image(.gearBoxIcon)
                                                            .resizable()
                                                            .frame(width: 15, height: 15)
                                                        Text("\(car.gearBox)")
                                                            .font(type: Montserrat.regular, size: 18)
                                                    }
                                                    
                                                    HStack(spacing: 3) {
                                                        Image(.seat)
                                                            .resizable()
                                                            .frame(width: 14, height: 15)
                                                        Text("\(car.numberOfSeat)")
                                                            .font(type: Montserrat.regular, size: 18)
                                                    }
                                                }
                                                .padding(.leading, 4)
                                                Spacer()
                                                
                                                HStack(spacing: 0) {
                                                    Text("$\(car.pricePerDay)/")
                                                        .font(type: Inter.medium, size: 20)
                                                    Text("day")
                                                        .font(type: Inter.regular, size: 16)
                                                }
                                            }
                                        }
                                        .padding(.horizontal, 8)
                                        .padding(.bottom, 10)
                                    }
                                }
                                .foregroundStyle(.black)
                                .padding(.horizontal, 10)
                                .padding(.bottom, 10)
                            
                            Divider()
                                .frame(maxWidth: .infinity, maxHeight: 2)
                                .background(Color.black.opacity(0.3))
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 60)
            }
            .tag(category)
            .refreshable {
                await viewModel.reloadAsync()
            }
        }
    }
}

#Preview {
    CategoriesView(scrollToTopToken: 0)
        .environmentObject(FavoriteStore())
}
