import Foundation
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 40) {
            tabButton(index: 0, activeIcon: .customHouse, inactiveIcon: .customHouseNon)
            tabButton(index: 1, activeIcon: .activeHeartIcon, inactiveIcon: .heartIconNon)
            tabButton(index: 2, activeIcon: .customChat, inactiveIcon: .customChatNon)
            tabButton(index: 3, activeIcon: .customProfile, inactiveIcon: .customProfileNon)
        }
        .frame(maxWidth: .infinity, minHeight: 95)
        .background(
            Rectangle()
                .fill(.white)
                .shadow(color: .shadowGray.opacity(0.9), radius: 13, x: 5, y: 5)
                .shadow(color: .shadowGray.opacity(0.9), radius: 10, x: -5, y: -5)
                .shadow(color: .shadowGray.opacity(0.2), radius: 10, x: 5, y: -5)
                .shadow(color: .shadowGray.opacity(0.2), radius: 10, x: -5, y: 5)
                .blur(radius: 0.5)
        )
    }
    
    @ViewBuilder
    private func tabButton(index: Int, activeIcon: ImageResource, inactiveIcon: ImageResource) -> some View {
        Button {
            selectedTab = index
        } label: {
            Image(selectedTab == index ? activeIcon : inactiveIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 55, height: 55)
                .scaleEffect(selectedTab == index ? 1.70 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedTab)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PreviewContainer()
}

private struct PreviewContainer: View {
    @State private var selectedTab = 0
    var body: some View {
        CustomTabBar(selectedTab: $selectedTab)
    }
}
