//
//  StageMapExplorerComposer.swift
//  CarameloApp
//
//  Created by Yago Marques on 03/04/23.
//

import SwiftUI

struct StageMapExplorerComposer {
    static func make(city: FPCityPresentationModel, mapName: String) -> some View {
        let concreteUseCases = FPDatabaseService(
            finderPuzzleDB: CoredataPersistanceManager(),
            appAccessManager: CoredataPersistanceManager()
        )
        let viewModel = StageMapExplorerViewModel(useCases: concreteUseCases)

        return StageMapExplorerView(viewModel: viewModel, mapName: mapName, cityPresentation: city)
    }
}
