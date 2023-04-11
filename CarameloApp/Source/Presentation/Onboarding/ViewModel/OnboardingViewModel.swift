//
//  OnboardingViewModel.swift
//  CarameloApp
//
//  Created by Yago Marques on 11/04/23.
//

import Foundation

typealias OnboardingUseCases = VerifyFirstUserAccess

class OnboardingViewModel: ObservableObject {
    @Published var onboardingItens: [OnboardingModel]
    @Published var toCities: Bool = false
    private let useCases: OnboardingUseCases

    init(onboardingItens: [OnboardingModel], useCases: OnboardingUseCases) {
        self.onboardingItens = onboardingItens
        self.useCases = useCases
    }

    var lastPage: Int {
        onboardingItens.count - 1
    }

    @MainActor
    func showOnboardingIfNeeded() async throws {
        if try await !useCases.isFirstAccess() {
            toCities = true
        }
    }
}
