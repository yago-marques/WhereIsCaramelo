//
//  FPCitiesConfig.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

enum FPCityNames: String {
    case fortaleza = "Fortaleza"
}

enum FPCityBackgrounds: String {
    case fortaleza = "fortalezaBackground"
}

enum FPCityMaps {
    static func fortaleza() -> [String] {
        [
            "Fortaleza1",
            "Fortaleza2",
            "Fortaleza3",
            "Fortaleza4",
            "Fortaleza5"
        ]
    }
}
