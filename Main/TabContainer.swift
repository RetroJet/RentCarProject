import SwiftUI

struct TabContainer: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: CategoriesView()
                case 2: HomeView()
                case 4: HomeView()
                default: HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab)
                .background(Color.white)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
