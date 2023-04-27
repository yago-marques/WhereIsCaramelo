//
//  OnboardingViewModel.swift
//  CarameloApp
//
//  Created by Yago Marques on 11/04/23.
//

import Foundation

typealias OnboardingUseCases = RegisterFirstUserAccess & CreateCity

class OnboardingViewModel: ObservableObject {
    @Published var onboardingItens: [OnboardingModel]
    @Published var moveToCities: Bool = false
    private let useCases: OnboardingUseCases

    init(onboardingItens: [OnboardingModel], useCases: OnboardingUseCases) {
        self.onboardingItens = onboardingItens
        self.useCases = useCases
    }

    var lastPage: Int {
        onboardingItens.count - 1
    }

    @MainActor
    func setupCity() async throws {
        for gameCity in FPGameCities.getDefault() {
            try await self.useCases.addCity(gameCity)
        }
        try await useCases.registerFirstAccess()
        moveToCities = true
    }
}
