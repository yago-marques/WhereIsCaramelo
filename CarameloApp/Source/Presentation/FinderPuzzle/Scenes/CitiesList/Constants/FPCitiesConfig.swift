//
//  FPCitiesConfig.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

enum FPCityNames: String {
    case fortaleza = "Fortaleza"
    case brasilia = "Brasília"
    case rioDeJaneiro = "Rio de Janeiro"
}

enum FPCityBackgrounds: String {
    case fortaleza = "fortalezaBackground"
    case brasilia = "brasiliaBackground"
    case rioDeJaneiro = "rioDeJaneiroBackground"
}

enum FPCityMaps {
    static func fortaleza() -> [String] {
        [
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
            "MapGameScene"
        ]
    }

    static func brasilia() -> [String] {
        [
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
        ]
    }

    static func rioDeJaneiro() -> [String] {
        [
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
            "MapGameScene",
        ]
    }
}
