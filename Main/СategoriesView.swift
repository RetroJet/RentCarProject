//
//  СategoriesView.swift
//  RentCarProject
//
//  Created by Nazar on 11.11.2025.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel = CategoriesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                // СКРОЛЛЯЩИЙСЯ КОНТЕНТ
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 20) {
                        ForEach(Array(viewModel.filteredCars.enumerated()), id: \.offset) { index, car in

                            NavigationLink {
                                CarDetailsView(viewModel: CarDetailsViewModel(car: car), car: car)
                            } label: {
                                Rectangle()
                                    .fill(.white)
                                    .frame(maxWidth: .infinity, minHeight: 199)
                                    .overlay(alignment: .topLeading) {
                                        VStack {
                                            HStack {
                                                Text(car.brand)
                                                    .font(type: Montserrat.medium, size: 16)
                                                Spacer()

                                                Button {
                                                    //
                                                } label: {
                                                    Image(.heartFilterIcon)
                                                        .renderingMode(.template)
                                                        .resizable()
                                                        .frame(width: 20, height: 18)
                                                        .foregroundStyle(car.favorite ? .customBlueButton : .bgGray)
                                                }
                                            }
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                            
                                            ZStack(alignment: .top) {
                                                Rectangle()
                                                    .fill(Color.clear)
                                                    .frame(maxWidth: .infinity, minHeight: 151)
                                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                                                Image(car.image)
                                                    .resizable()
                                                    .frame(
                                                        width: CGFloat(car.imageWidthCar),
                                                        height: CGFloat(car.imageHeightCar)
                                                    )
                                                    .padding(.horizontal, 26)
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
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                            
                            Divider()
                                .frame(maxWidth: .infinity, maxHeight: 2)
                                .background(Color.black.opacity(0.3))
                        }
                    }
                    .padding(.top, 115)
                    .padding(.bottom, 90)
                }
                
                // ФИКСИРОВАННЫЙ ВЕРХ
                VStack(spacing: 15) {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.white)
                            .frame(height: 50)
                            .shadow(color: .shadowGray.opacity(1), radius: 7, x: 7, y: 7)
                        
                        HStack {
                            ZStack(alignment: .leading) {
                                if viewModel.searchText.isEmpty {
                                    Text("Search Car")
                                        .font(type: Montserrat.medium, size: 16)
                                        .foregroundColor(.bgGray)
                                }
                                
                                TextField("", text: $viewModel.searchText)
                                    .font(type: Montserrat.medium, size: 16)
                                    .foregroundColor(.black)
                            }
                            
                            Button {
                                hideKeyboard()
                            } label: {
                                Image(.searchIcon)
                                    .resizable()
                                    .frame(width: 18, height: 18)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.horizontal, 17)
                    
                    HStack {
                        Button {
                            //
                        } label: {
                            Image(.filterIcon)
                                .resizable()
                                .opacity(0.2)
                                .frame(width: 23, height: 20)
                                .padding(.leading, 20)
                        }
                        
                        Spacer()
                        
                        HStack {
                            CarCategoryMenu(selectedCategory: $viewModel.selectedCategory)
                                .padding(.leading, 25)
                                .padding(.trailing, 10)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 31)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 5)
                }
                .background(.white)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    CategoriesView()
}
