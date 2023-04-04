//
//  FPCityPresentationModel.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

enum FPCityStatus: String {
    case completed
    case locked
    case unlocked
}

struct FPCityPresentationModel: Identifiable {
    let id = UUID()
    let name: String
    let imageBackground: String
    let allStages: Int
    let completedStages: Int
    let currentMap: String?
    let isDone: Bool
    var status: FPCityStatus
}
