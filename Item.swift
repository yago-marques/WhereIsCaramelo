//
//  Item.swift
//  Where's Caramelo
//
//  Created by Davi Capistrano on 29/03/23.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID().uuidString
    let backgroundColor : Color
    let image: String
    let title: String
    let subtitle: String
}

let itemData = [
    Item(backgroundColor: Color("Color1"), image: "image01", title: "Texto Principal", subtitle: "Texto secundário aqui"),
    Item(backgroundColor: Color("Color2"), image: "image02", title: "Texto Principal", subtitle: "Texto secundário aqui"),
    Item(backgroundColor: Color("Color3"), image: "image03", title: "Texto Principal", subtitle: "Texto secundário aqui"),
]


