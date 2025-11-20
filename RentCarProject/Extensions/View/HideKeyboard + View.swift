//
//  HideKeyboard + View.swift
//  RentCarProject
//
//  Created by Nazar on 20.11.2025.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
