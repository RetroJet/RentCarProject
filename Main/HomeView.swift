//
//  SwiftUIView.swift
//  RentCarProject
//
//  Created by Nazar on 31.10.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var currentCard = 0
    
    var body: some View {
            ZStack(alignment: .top) {
                    VStack(spacing: 0) {
                        HStack {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                    .fill(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .shadow(color: .shadowGray.opacity(1), radius: 7, x: 7, y: 7)
                                    .blur(radius: 0.2)
                                
                                HStack(spacing: 9) {
                                    Button {
                                        //
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .frame(width: 40, height: 40)
                                                .foregroundStyle(.shadowGray)
                                                .padding(5)
                                            Image(.location)
                                                .resizable()
                                                .frame(width: 17, height: 22)
                                                .foregroundStyle(.black)
                                        }
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Your Location")
                                            .font(type: Montserrat.medium, size: 12)
                                            .foregroundStyle(.customGray)
                                        
                                        Text("Mumbai,India")
                                            .font(type: Montserrat.medium, size: 16)
                                    }
                                }
                            }
                            .padding(.leading, 16)
                            .padding(.trailing, 20)
                            
                            Button {
                                //
                            } label: {
                                Image(.ava)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            }
                            .padding(.trailing, 16)
                        }
                        
                        ScrollView(showsIndicators: false) {
                        VStack(spacing: 5) {
                            TabView(selection: $currentCard) {
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
                                            Image(.mercedes)
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
                                            Image(.sale)
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
                                            Image(.rollsRoyceCar)
                                                .resizable()
                                                .frame(width: 380, height: 124)
                                                .padding(.top, 76)
                                        }
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal, 10)
                                .tag(1)
                            }
                            .frame(height: 210)
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            .padding(.top, 15)
                            
                            HStack() {
                                ForEach(0..<2, id: \.self) { index in
                                    Capsule()
                                        .frame(width: currentCard == index ? 15 : 10, height: 4)
                                        .foregroundStyle(currentCard == index ? .customPageSliderDarkGray : .customPageSliderGray)
                                        .onTapGesture {
                                            currentCard = index
                                        }
                                        .animation(.easeInOut, value: currentCard)
                                }
                            }
                        }
                        .frame(minWidth: 373, minHeight: 209)
                        
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
                            
                            ScrollView(.horizontal, showsIndicators: false){
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
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack() {
                                Text("Featured Cars")
                                    .font(type: Poppins.medium, size: 14)
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(FeaturedCar.featuredCarsData) { car in
                                        Button {
                                            //
                                        } label: {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color(car.bgColor))
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
                                                            Image(car.image)
                                                                .resizable()
                                                                .frame(
                                                                    width: CGFloat(car.imageWidthSize),
                                                                    height: CGFloat(car.imageHeightSize)
                                                                )
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
                                    .padding(.vertical, 10)
                                }
                            }
                        }
                        .padding(.top, 15)
                        .padding(.horizontal, 10)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack() {
                                Text("Your Recent rentals")
                                    .font(type: Poppins.medium, size: 14)
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(RecentCar.recentCarsData) { car in
                                        Button {
                                            //
                                        } label: {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(Color(car.bgColor))
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
                                                            Image(car.image)
                                                                .resizable()
                                                                .frame(
                                                                    width: CGFloat(car.imageWidthSize),
                                                                    height: CGFloat(car.imageHeightSize)
                                                                )
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
                                    .padding(.vertical, 10)
                                }
                            }
                        }
                        .padding(.top, 15)
                        .padding(.horizontal, 10)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 100)
                }
                
                TopOverlayBar()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .overlay(Color.white.ignoresSafeArea(edges: .top))
            }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}

// Маленькая белая верхняя полоска
private struct TopOverlayBar: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(height: 0)
    }
}

struct CarModelView: View {
    var carModel: CarModel
    
    var body: some View {
        Image(carModel.image)
    }
}

struct FeaturedCarView: View {
    var featuredCar: FeaturedCar
    
    var body: some View {
        
    }
}
