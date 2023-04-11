//
//  OnboardingComposer.swift
//  CarameloApp
//
//  Created by Yago Marques on 11/04/23.
//

import SwiftUI

struct OnboardingComposer {
    static func make() -> some View {
        OnBoardingView(
            viewModel: OnboardingViewModel(
                onboardingItens: OnboardingModel.getData(), useCases: FPDatabaseService(finderPuzzleDB: CoredataPersistanceManager(), appAccessManager: CoredataPersistanceManager())
            )
        )
    }
}
