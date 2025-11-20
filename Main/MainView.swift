//
//  ContentView.swift
//  RentCarProject
//
//  Created by Nazar on 30.10.2025.
//
import UIKit
import SwiftUI

struct MainView: View {
    @State private var isShowingNextScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                LinearGradient(
                    colors: [.black, .customGradientBlue],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Image(.cadillacMain)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 417, minHeight: 341 ,alignment: .leading)
                        .padding(.top, 45)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Premium cars, \nenjoy the luxury")
                            .font(type: Mate.regular, size: 40)
                            .foregroundStyle(.customBez)
                        
                        Text("Premium and prestige car daily \nand monthly rental. Experience \nthe thrill at a lower price.")
                            .font(type: Montserrat.semiBold, size: 16)
                            .foregroundStyle(.customGray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 186, alignment: .center)
                    .padding(.top, 75)
                    
                    Button {
                        isShowingNextScreen.toggle()
                        //
                    } label: {
                        Text("Let's Go")
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .font(type: Montserrat.bold, size: 26)
                            .foregroundStyle(.customBlueButton)
                            .background(Color.customBez)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                    .padding(EdgeInsets(top: 33, leading: 20, bottom: 70, trailing: 20))
                }
                .navigationDestination(isPresented: $isShowingNextScreen) {
                    TabContainer()
                }
            }
            .ignoresSafeArea(edges: .bottom)
            }
        }
    }

    #Preview {
        MainView()
    }


