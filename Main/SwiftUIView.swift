//
//  SwiftUIView.swift
//  RentCarProject
//
//  Created by Nazar on 31.10.2025.
//

import SwiftUI

struct SwiftUIView: View {
    
    var body: some View {
        ScrollView {
            VStack() {
                HStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                            .fill(.white)
                            .shadow(color: .shadowGray.opacity(0.9), radius: 13, x: 5, y: 5)
                            .shadow(color: .shadowGray.opacity(0.9), radius: 10, x: -5, y: -5)
                            .shadow(color: .shadowGray.opacity(0.2), radius: 10, x: 5, y: -5)
                            .shadow(color: .shadowGray.opacity(0.2), radius: 10, x: -5, y: 5)
                            .blur(radius: 0.5)
                        
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
                
                TabView {
                    ZStack(alignment: .topTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.shadowGray)
                            .frame(maxWidth: .infinity, minHeight: 200)
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
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(
                                LinearGradient(
                                    colors: [.gradientGray, .gradientGray2],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(maxWidth: .infinity, minHeight: 200)
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
                                Image(.rollsRoyce)
                                    .resizable()
                                    .frame(width: 380, height: 124)
                                    .padding(.top, 76)
                            }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                }
                .frame(height: 209)
                .tabViewStyle(.page(indexDisplayMode: .always))
                .padding(EdgeInsets(top: 15, leading: 6.5, bottom: 0, trailing: 6.5))
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("Track from Map")
                            .font(type: Poppins.medium, size: 14)
                    }
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxWidth: .infinity, minHeight: 112)
                            .overlay {
                                Image(.geoMap)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .offset(y: 80)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 10)
                .padding(.top, 14)
                
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
                                            .fill(Color(.white))
                                            .frame(width: 55, height: 55)
                                            .shadow(color: .shadowGray.opacity(0.7), radius: 2, x: 3, y: 3)
                                            .shadow(color: .shadowGray.opacity(0.1), radius: 2, x: -3, y: -3)
                                            .shadow(color: .shadowGray.opacity(0.2), radius: 2, x: 3, y: -3)
                                            .shadow(color: .shadowGray.opacity(0.2), radius: 2, x: -3, y: 3)
                                        
                                            .blur(radius: 0.6)
                                        
                                        
                                        Image(model.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                            .padding(5)
                                            .clipped()
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .frame(height: 66)
                    }
                }
                .padding(.top, 17)
                .padding(.leading, 10)
                .padding(.trailing, 2)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack() {
                        Text("Featured Cars")
                            .font(type: Poppins.medium, size: 14)
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                //.fill(.white)
                                    .frame(width: 300, height: 160)
                                VStack(alignment: .leading) {
                                    HStack() {
                                        Text("Porsche  Carera 911")
                                            .font(type: Montserrat.medium, size: 13)
                                        Spacer()
                                    }
                                    .padding(.top, -20)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 15)
                .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    SwiftUIView()
}

struct CarModelView: View {
    var carModel: CarModel
    
    var body: some View {
        Image(carModel.image)
    }
}
