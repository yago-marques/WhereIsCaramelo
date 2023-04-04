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
            "fortalezaMapStage1",
            "fortalezaMapStage2",
            "fortalezaMapStage3",
            "fortalezaMapStage4",
            "fortalezaMapStage5",
            "fortalezaMapStage6"
        ]
    }

    static func brasilia() -> [String] {
        [
            "brasiliaMapStage1",
            "brasiliaMapStage2",
            "brasiliaMapStage3",
            "brasiliaMapStage4",
            "brasiliaMapStage5",
        ]
    }

    static func rioDeJaneiro() -> [String] {
        [
            "rioDeJaneiroMapStage1",
            "rioDeJaneiroMapStage2",
            "rioDeJaneiroMapStage3",
            "rioDeJaneiroMapStage4",
        ]
    }
}
