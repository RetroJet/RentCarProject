//
//  StartView.swift
//  RentCarProject
//
//  Created by Nazar on 30.10.2025.
//

import SwiftUI

struct StartView: View {
    @State private var isShowingNextScreen = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                backgroundGradient
                VStack(alignment: .leading) {
                    mainImage
                    titleSection
                    startButton
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationDestination(isPresented: $isShowingNextScreen) {
                TabContainer()
            }
        }
    }
}

//MARK: -> Subviews
private extension StartView {
    var backgroundGradient: some View {
        LinearGradient(
            colors: [.black, .customGradientBlue],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
   
    var mainImage: some View {
        Image(.cadillacMain)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minWidth: 417, minHeight: 341, alignment: .leading)
            .padding(.top, 45)
    }
    
    var titleSection: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Premium cars, \nenjoy the luxury")
                .font(type: Mate.regular, size: 40)
                .foregroundStyle(.customBeige)
            
            Text("Premium and prestige car daily \nand monthly rental. Experience \nthe thrill at a lower price.")
                .font(type: Montserrat.semiBold, size: 16)
                .foregroundStyle(.customBeige)
        }
        .frame(maxWidth: .infinity, maxHeight: 186, alignment: .center)
        .padding(.top, 75)
    }

    var startButton: some View {
        Button {
            isShowingNextScreen.toggle()
        } label: {
            Text("Let's Go")
                .frame(maxWidth: .infinity, minHeight: 60)
                .font(type: Montserrat.bold, size: 26)
                .foregroundStyle(.customBlueButton)
                .background(Color.customBeige)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .padding(EdgeInsets(top: 33, leading: 20, bottom: 70, trailing: 20))
    }
}

#Preview {
    StartView()
}
