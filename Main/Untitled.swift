//
//  Untitled.swift
//  RentCarProject
//
//  Created by Nazar on 01.11.2025.
//

//
//  SwiftUIView.swift
//  RentCarProject
//
//  Created by Nazar on 31.10.2025.
//

import SwiftUI

struct LO: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 12) {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.shadowGray)
                        .padding(.vertical, 5)
                        .padding(.leading, 5)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Your Location")
                            .font(type: Montserrat.semiBold, size: 12)
                            .foregroundStyle(.shadowGray)
                            .lineLimit(1)
                            .minimumScaleFactor(0.9)

                        Text("Mumbai, India")
                            .font(type: Montserrat.semiBold, size: 16)
                            .lineLimit(1)
                            .minimumScaleFactor(0.9)
                    }

                    Spacer(minLength: 0)
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .padding(.trailing, 12) // асимметрия, как у вас
                .background {
                    Capsule(style: .continuous)
                        .fill(.white)
                        // Две тени вместо четырёх: светлая и тёмная
                        .shadow(color: .shadowGray.opacity(0.9), radius: 13, x: 5, y: 5)
                        .shadow(color: .white, radius: 10, x: -5, y: -5)
                        // Обводки
                        .overlay {
                            Capsule(style: .continuous)
                                .stroke(.shadowGray.opacity(0.5), lineWidth: 3)
                        }
                        .overlay {
                            Capsule(style: .continuous)
                                .stroke(.white.opacity(0.5), lineWidth: 3)
                                .blendMode(.overlay)
                        }
                }
                .contentShape(Capsule()) // если понадобится интерактив
                .padding(.horizontal, 16)
            }
        }
        // .scrollIndicators(.hidden) // при желании скрыть индикаторы
    }
}

#Preview {
    LO()
}
