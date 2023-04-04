//
//  FinderPuzzleViewModel.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import Foundation

typealias CityListUseCases = LoadCities & CreateCity & VerifyFirstUserAccess & RegisterFirstUserAccess

final class FinderPuzzleViewModel: ObservableObject {
    @Published var cities: [FPCityPresentationModel] = []
    private let useCases: CityListUseCases

    init(useCases: CityListUseCases) {
        self.useCases = useCases
    }

    @MainActor
    private func fetchCities() async throws {
        let businessCities = try await useCases.fetchCities()
        let presentationCities = businessCities.map {FPCityMapper.toPresentation($0)}

        self.cities = self.citiesWithUnlockedCityIfPossible(presentationCities)
    }

    private func citiesWithUnlockedCityIfPossible(_ cities: [FPCityPresentationModel]) -> [FPCityPresentationModel] {
        var presentationCities = cities
        if let currentCityIndex = presentationCities.firstIndex(where: {$0.status == .locked}) {
            presentationCities[currentCityIndex].status = .unlocked
        }

        return presentationCities
    }

    private func setupCitiesIfNeeded() async throws {
        if try await useCases.isFirstAccess() {
            for gameCity in FPGameCities.getDefault() {
                try await self.useCases.addCity(gameCity)
            }
            try await useCases.registerFirstAccess()
        }
    }

    func buildLayout() async throws {
        try await self.setupCitiesIfNeeded()
        try await self.fetchCities()
    }

}
