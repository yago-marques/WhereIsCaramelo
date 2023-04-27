//
//  InitialView.swift
//  CarameloApp
//
//  Created by Yago Marques on 12/04/23.
//

import SwiftUI

enum AccessStates {
    case waiting, first, normal
}

struct AccessScannerComposer {
    static func make() -> some View {
        let viewModel = AccessScannerViewModel(
            useCases: FPDatabaseService(
                finderPuzzleDB: CoredataPersistanceManager(),
                appAccessManager: CoredataPersistanceManager())
        )

        return AccessScannerView(viewModel: viewModel)
    }
}

struct AccessScannerView: View {
    @StateObject var viewModel: AccessScannerViewModel

    var body: some View {
        NavigationStack {
            switch viewModel.access {
            case .waiting:
                Text("waiting...")
            case .first:
                OnboardingComposer.make()
            case .normal:
                CitiesListComposer.make()
            }
        }
        .onAppear {
            Task {
                await viewModel.verifyIfisFirstAccess()
            }

        }
    }
}
