//
//  GameCities.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

struct FPGameCities {
    static func getDefault() -> [FPCityBusinessModel] {
        [
            .init(
                name: FPCityNames.fortaleza.rawValue,
                imageBackground: FPCityBackgrounds.fortaleza.rawValue,
                stages: FPCityMaps.fortaleza().map{.init(map: $0, isDone: false)},
                isDone: false
            )
        ]
    }
}
