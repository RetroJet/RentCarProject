//
//  Font + View.swift
//  RentCarProject
//
//  Created by Nazar on 31.10.2025.
//

import SwiftUI

extension View {
    func font<T: RawRepresentable>(type: T, size: CGFloat = 16) -> some View where T.RawValue == String {
        self
            .font(Font.custom(type.rawValue, size: size))
    }
}
