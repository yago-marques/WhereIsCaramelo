//
//  StageMapExplorerViewModel.swift
//  CarameloApp
//
//  Created by Yago Marques on 03/04/23.
//

import Foundation

typealias StageMapExplorerUseCases = UpdateCityStage

final class StageMapExplorerViewModel: ObservableObject {
    @Published var popup = (success: false, error: false)
    private let useCases: StageMapExplorerUseCases

    init(useCases: StageMapExplorerUseCases) {
        self.useCases = useCases
    }

    func markTaskAsDone(cityName: String) async throws {
        try await self.useCases.markStageAsDone(cityName: cityName)
    }

    func showSuccessPopup() {
        self.popup = (true, false)
    }
}
