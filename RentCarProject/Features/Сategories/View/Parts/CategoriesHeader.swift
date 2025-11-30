//
//  CategoriesHeader.swift
//  RentCarProject
//
//  Created by Nazar on 28.11.2025.
//

import SwiftUI

struct CategoriesHeader: View {
    @Binding var searchText: String
    @Binding var selectedCategory: CarCategory

    var body: some View {
        VStack(spacing: 15) {
            searchBar
            filterAndCategoryRow
        }
        .background(.white)
    }
}

//MARK: -> Subviews
private extension CategoriesHeader {
    var searchBar: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 100)
                .fill(.white)
                .frame(height: 50)
                .shadow(color: .shadowGray.opacity(1), radius: 7, x: 7, y: 7)
            
            HStack {
                ZStack(alignment: .leading) {
                    if searchText.isEmpty {
                        Text("Search Car")
                            .font(type: Montserrat.medium, size: 16)
                            .foregroundColor(.bgGray)
                    }
                    
                    TextField("", text: $searchText)
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
    }
    
    var filterAndCategoryRow: some View {
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
                CategoriesCarMenu(selectedCategory: $selectedCategory)
                    .padding(.leading, 25)
                    .padding(.trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 31)
        .padding(.horizontal, 10)
        .padding(.bottom, 5)
    }
}
