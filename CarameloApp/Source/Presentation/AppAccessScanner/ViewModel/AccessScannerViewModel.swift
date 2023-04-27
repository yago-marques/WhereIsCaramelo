//
//  AccessScannerViewModel.swift
//  CarameloApp
//
//  Created by Yago Marques on 12/04/23.
//

import Foundation

typealias AccessScannerUseCases = VerifyFirstUserAccess

final class AccessScannerViewModel: ObservableObject {
    @Published var access: AccessStates = .waiting
    private let useCases: AccessScannerUseCases

    init(useCases: AccessScannerUseCases) {
        self.useCases = useCases
    }

    @MainActor
    func verifyIfisFirstAccess() async {
        do {
            access = try await self.useCases.isFirstAccess() ? .first : .normal
        } catch {
            print(error)
        }
    }

}
