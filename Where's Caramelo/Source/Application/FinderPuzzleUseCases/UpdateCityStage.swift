//
//  UpdateCityStage.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 29/03/23.
//

import Foundation

protocol UpdateCityStage {
    func markStageAsDone(cityName: String) async throws
}
