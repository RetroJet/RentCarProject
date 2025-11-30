//
//  RentCarProjectApp.swift
//  RentCarProject
//
//  Created by Nazar on 30.10.2025.
//

import SwiftUI

@main
struct RentCarProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var favorites = FavoriteStore()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(favorites)
        }
    }
}
