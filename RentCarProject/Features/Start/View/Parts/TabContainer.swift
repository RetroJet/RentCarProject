//
//  TabContainer.swift
//  RentCarProject
//
//  Created by Nazar on 30.10.2025.
//

import SwiftUI

struct TabContainer: View {
    @State private var selectedTab = 0
    @State private var homeScrollToTopToken = 0
    @State private var categoriesScrollToTopToken = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                homePage
                categoriesPage
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .compositingGroup()
            .animation(.smooth(duration: 0.25), value: selectedTab)
            
            tabBarLayer
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

//MARK: -> Subviews
private extension TabContainer {
    var homePage: some View {
        HomeView(scrollToTopToken: homeScrollToTopToken)
            .opacity(selectedTab == 0 ? 1 : 0)
            .scaleEffect(selectedTab == 0 ? 1 : 0.98)
            .allowsHitTesting(selectedTab == 0)
            .blur(radius: selectedTab == 0 ? 0 : 1.5)
    }
    
    var categoriesPage: some View {
        CategoriesView(scrollToTopToken: categoriesScrollToTopToken)
            .opacity(selectedTab == 1 ? 1 : 0)
            .scaleEffect(selectedTab == 1 ? 1 : 0.98)
            .allowsHitTesting(selectedTab == 1)
            .blur(radius: selectedTab == 1 ? 0 : 1.5)
    }
    
    var tabBarLayer: some View {
        CustomTabBar(selectedTab: $selectedTab) { index in
            if index == selectedTab {
                switch index {
                case 0:
                    homeScrollToTopToken &+= 1
                case 1:
                    categoriesScrollToTopToken &+= 1
                default:
                    break
                }
                
            } else {
                selectedTab = index
            }
        }
        .background(Color.white)
    }
}

#Preview {
    TabContainer()
        .environmentObject(FavoriteStore())
}

