//
//  UserAccessUseCase.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 29/03/23.
//

import Foundation

protocol LoadCities {
    func fetchCities() async throws -> [FPCityBusinessModel]
}
