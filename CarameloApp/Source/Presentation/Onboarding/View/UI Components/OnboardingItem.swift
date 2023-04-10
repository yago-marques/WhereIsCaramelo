//
//  Item.swift
//  Where's Caramelo
//
//  Created by Davi Capistrano on 29/03/23.
//

import SwiftUI

struct OnboardingItem: Identifiable {
    let id = UUID().uuidString
    let backgroundColor : Color
    let lottiefile: String
    let title: String
    let subtitle: String
}

let itemData = [
    OnboardingItem(backgroundColor: Color("Color1"), lottiefile: "dog",title:  "Texto Principal", subtitle: "Texto 1 aqui"),
    OnboardingItem(backgroundColor: Color("Color2"), lottiefile: "dog", title: "Texto Principal", subtitle: "Texto 2 aqui"),
    OnboardingItem(backgroundColor: Color("Color3"), lottiefile: "dog", title: "Texto Principal", subtitle: "Texto 3 aqui"),
]
