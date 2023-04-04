//
//  CreateCity.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 29/03/23.
//

import Foundation

protocol CreateCity {
    func addCity(_ city: FPCityBusinessModel) async throws
}
