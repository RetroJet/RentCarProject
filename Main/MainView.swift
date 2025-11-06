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
                
                VStack(alignment: .center, spacing: 24) {
                    Image(.cadillac)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, minHeight: 341, alignment: .leading)
                        .padding(.top, 115)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Premium cars, \nenjoy the luxury")
                            .font(type: Mate.regular, size: 40)
                            .foregroundStyle(.customBez)
                        
                        Text("Premium and prestige car daily \nand monthly rental. Experience \nthe thrill at a lower price.")
                            .font(type: Montserrat.semiBold, size: 16)
                            .foregroundStyle(.customGray)
                
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 70)
                   
                    Button {
                        isShowingNextScreen.toggle()
                       //
                    } label: {
                        Text("Let's Go")
                            .font(type: Montserrat.bold, size: 26)
                            .foregroundStyle(.customBlueButton)
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color.customBez)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                    .padding(.top, 33)
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 90)
                }
            }
            .navigationDestination(isPresented: $isShowingNextScreen) {
                SwiftUIView()
            }
        }

    }
}

    #Preview {
        MainView()
    }


