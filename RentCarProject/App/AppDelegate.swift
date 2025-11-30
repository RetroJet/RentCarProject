//
//  AppDelegate.swift
//  RentCarProject
//
//  Created by Nazar on 27.11.2025.
//

import SwiftUI
import FirebaseCore

final class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

      FirebaseApp.configure()
      
      print("Firebase called")

    return true
  }
}
