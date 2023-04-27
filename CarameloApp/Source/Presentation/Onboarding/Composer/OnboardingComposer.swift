//
//  OnboardingComposer.swift
//  CarameloApp
//
//  Created by Yago Marques on 11/04/23.
//

import SwiftUI

struct OnboardingComposer {
    static func make() -> some View {
        let viewModel = OnboardingViewModel(
            onboardingItens: OnboardingModel.getData(),
            useCases: FPDatabaseService(
                finderPuzzleDB: CoredataPersistanceManager(),
                appAccessManager: CoredataPersistanceManager()
            )
        )

        return OnBoardingView(
            viewModel: viewModel
        )
    }
}
