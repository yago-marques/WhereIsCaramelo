//
//  DatabaseService.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 29/03/23.
//

import Foundation

final class FPDatabaseService {
    private let finderPuzzleDB: FinderPuzzleDatabase
    private let appAccessManager: UserAccessManager

    init(finderPuzzleDB: FinderPuzzleDatabase, appAccessManager: UserAccessManager) {
        self.finderPuzzleDB = finderPuzzleDB
        self.appAccessManager = appAccessManager
    }

    private func getCities() async -> [FPRemoteCity] {
        guard let cities = try? await finderPuzzleDB.readCities() else { return [] }

        return cities
    }

    private func getCityToUpdate() async throws -> FPRemoteCity? {
        let cities = await self.getCities()
        guard let currentCity = cities.first(where: {!$0.isDone}) else { return nil }
        var cityToUpdate = currentCity

        if let currentStageIndex = currentCity.stages.firstIndex(where: {!$0.isDone}) {
            cityToUpdate.stages[currentStageIndex].isDone = true
        } else {
            cityToUpdate.isDone = true
        }

        return cityToUpdate
    }
}

extension FPDatabaseService: LoadCities {
    func fetchCities() async throws -> [FPCityBusinessModel] {
        let cities = await self.getCities()

        return cities.map {FPCityMapper.toBusiness($0)}
    }
}

extension FPDatabaseService: UpdateCityStage {
    func markStageAsDone(cityName: String) async throws {
        if let cityModel = try await self.getCityToUpdate() {
            try await finderPuzzleDB.updateCity(cityModel)
        }
    }
}

extension FPDatabaseService: CreateCity {
    func addCity(_ city: FPCityBusinessModel) async throws {
        try await finderPuzzleDB.createCity(FPCityMapper.toRemote(city))
    }
}

extension FPDatabaseService: VerifyFirstUserAccess {
    func isFirstAccess() async throws -> Bool {
        try await self.appAccessManager.isFirstAccess()
    }
}

extension FPDatabaseService: RegisterFirstUserAccess {
    func registerFirstAccess() async throws {
        try await self.appAccessManager.registerFirstAccess()
    }
}
