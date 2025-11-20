//
//  RentCarProjectApp.swift
//  RentCarProject
//
//  Created by Nazar on 30.10.2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      print("🔥 AppDelegate запустился!")

      FirebaseApp.configure()
      
      print("🔥 FirebaseApp.configure() вызван!")

    return true
  }
}

@main
struct RentCarProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
