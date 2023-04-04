//
//  CityListComposer.swift
//  Where's Caramelo
//
//  Created by Yago Marques on 30/03/23.
//

import SwiftUI

struct CitiesListComposer {
    static func make() -> some View {
        let concreteUseCases = FPDatabaseService(
            finderPuzzleDB: CoredataPersistanceManager(),
            appAccessManager: CoredataPersistanceManager()
        )
        let viewModel = FinderPuzzleViewModel(useCases: concreteUseCases)

        return FinderPuzzleView(viewModel: viewModel)
    }
}
