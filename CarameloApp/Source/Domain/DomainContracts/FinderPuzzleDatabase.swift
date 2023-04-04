//
//  FinderPuzzleDatabase.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 29/03/23.
//

import Foundation

protocol FinderPuzzleDatabase {
    func createCity(_ city: FPRemoteCity) async throws
    func updateCity(_ city: FPRemoteCity) async throws
    func readCities() async throws -> [FPRemoteCity]
}
