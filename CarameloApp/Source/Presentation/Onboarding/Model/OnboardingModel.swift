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
    let lottiefile: String?
    let image: String?
    let title: String
    let subtitle: String

    static func getData() -> [OnboardingModel] {
        [
            OnboardingModel(
                backgroundColor: .black,
                lottiefile: nil,
                image: "carameloStatus",
                title:  "Olá, eu sou o caramelo",
                subtitle: "Você acha que consegue me achar nessa cidade? rs"
            ),
            OnboardingModel(
                backgroundColor: .black,
                lottiefile: nil,
                image: "carameloStatus",
                title: "Cidades",
                subtitle: "Cada cidade possui fases, ache o caramelo quantas vezes for preciso em cada cidade e acompanhe seu progresso"
            ),
            OnboardingModel(
                backgroundColor: .black,
                lottiefile: nil,
                image: "carameloStatus",
                title: "Mapa",
                subtitle: "Você pode movimentar o mapa e também ampliar com o movimento de zoom"
            ),
        ]
    }
}
