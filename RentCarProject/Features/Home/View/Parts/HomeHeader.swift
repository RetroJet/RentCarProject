//
//  HomeHeader.swift
//  RentCarProject
//
//  Created by Nazar on 01.11.2025.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                locationBlock
                
                HStack(spacing: 9) {
                    locationButton
                    locationTexts
                }
            }
            .padding(.leading, 16)
            .padding(.trailing, 20)
            
            avatarButton
        }
    }
}

//MARK: -> Subviews
private extension HomeHeader {
    var locationBlock: some View {
        RoundedRectangle(cornerRadius: 50, style: .continuous)
            .fill(.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .shadow(color: .shadowGray.opacity(1), radius: 7, x: 7, y: 7)
            .blur(radius: 0.2)
    }
    
    var locationButton: some View {
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
    }
    
    var locationTexts: some View {
        VStack(alignment: .leading) {
            Text("Your Location")
                .font(type: Montserrat.medium, size: 12)
                .foregroundStyle(.customGray)
            
            Text("Mumbai,India")
                .font(type: Montserrat.medium, size: 16)
        }
    }
    
    var avatarButton: some View {
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
}

#Preview {
    HomeHeader()
}
