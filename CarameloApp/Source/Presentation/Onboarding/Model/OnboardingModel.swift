//
//  Item.swift
//  Where's Caramelo
//
//  Created by Davi Capistrano on 29/03/23.
//

import SwiftUI

struct OnboardingModel: Identifiable {
    let id = UUID()
    let backgroundColor : Color
    let lottiefile: String
    let title: String
    let subtitle: String

    static func getData() -> [OnboardingModel] {
        [
            OnboardingModel(backgroundColor: .blue, lottiefile: "dog",title:  "Texto Principal", subtitle: "Texto 1 aqui"),
            OnboardingModel(backgroundColor: .yellow, lottiefile: "dog", title: "Texto Principal", subtitle: "Texto 2 aqui"),
            OnboardingModel(backgroundColor: .cyan, lottiefile: "dog", title: "Texto Principal", subtitle: "Texto 3 aqui"),
        ]
    }
}
